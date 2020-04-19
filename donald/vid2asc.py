"""
Convert a video to asciinema video

References:
- https://www.sicara.ai/blog/2019-03-12-edge-detection-in-opencv
- https://en.wikipedia.org/wiki/Code_page_437
- https://www.pyimagesearch.com/2015/03/23/sliding-windows-for-object-detection-with-python-and-opencv/
"""

# Importing OpenCV
import cv2
import sys
import numpy as np


def sliding_window(image, windowSize):
    # slide a window across the image
    for y in range(0, image.shape[0], windowSize[0]):
        for x in range(0, image.shape[1], windowSize[1]):
            # yield the current window
            yield (x, y, image[y:y + windowSize[0], x:x + windowSize[1]])


# Setup the bitmap font tile map (16x9) with border (8x8)
# Note: (width, height)
font_file = "Codepage-437.png"
(font_tile_h, font_tile_w) = (16, 9)
font_border_hw = 8
#
font_image = cv2.imread(font_file, cv2.IMREAD_GRAYSCALE)
font_image[font_image > 0] = 255
(font_image_h, font_image_w) = font_image.shape
font = font_image[font_border_hw:(
    font_image_h - font_border_hw), font_border_hw: (font_image_w - font_border_hw)]
(font_h, font_w) = font.shape
(font_tiles_y, font_tiles_x) = (int(font_h/font_tile_h), int(font_w/font_tile_w))
font_tiles = font_tiles_y * font_tiles_x

# build a sequence of font tiles
font_tile_seq = np.empty([font_tiles, font_tile_h, font_tile_w], np.uint8)
for (x, y, font_tile) in sliding_window(font, windowSize=(font_tile_h, font_tile_w)):
    (x_idx, y_idx) = (int(x/font_tile_w), int(y/font_tile_h))
    idx = (y_idx * font_tiles_x) + x_idx
    font_tile_seq[idx] = font_tile


def decode_fourcc(v):
    # Convert a FOURCC code from numeric to character
    v = int(v)
    return "".join([chr((v >> 8 * i) & 0xFF) for i in range(4)])


# Create input video stream
cap = cv2.VideoCapture('../pixar.mp4')
if (cap.isOpened() == False):
    print("Error opening input video stream or file")

(cap_h, cap_w) = (int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT)),
                  int(cap.get(cv2.CAP_PROP_FRAME_WIDTH)))

# Create an output video stream based on attributes of input
fourcc = cv2.VideoWriter_fourcc(*decode_fourcc(cap.get(cv2.CAP_PROP_FOURCC)))
out = cv2.VideoWriter('output.mp4', fourcc, cap.get(cv2.CAP_PROP_FPS),
                      (cap_w, cap_h), False)
if (out.isOpened() == False):
    print("Error opening input video stream or file")


def generate_edge_frame(frame):
    # Convert the image to grayscale.
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Smooth without removing edges.
    gray_filtered = cv2.bilateralFilter(gray, 7, 50, 50)

    # Apply the canny filter
    edges_filtered = cv2.Canny(gray_filtered, 60, 120)
    return edges_filtered


def generate_ascii_frame(frame):
    ascii_frame = np.zeros(frame.shape, np.uint8)
    for (x, y, frame_tile) in sliding_window(frame, windowSize=(font_tile_h, font_tile_w)):
        # if the frame doesn't match the font tile size, ignore it
        if frame_tile.shape[0] != font_tile_h or frame_tile.shape[1] != font_tile_w:
            continue

        candidate = 0
        best_sum = sys.maxsize
        for i in range(font_tiles):
            delta = frame_tile - font_tile_seq[i]
            delta[delta > 0] = 1  # handle uint8 wraparound
            sum = int(np.sum(delta))
            if sum == 0:
                candidate = i
                break
            if sum < best_sum:
                best_sum = sum
                candidate = i

        ascii_frame[y:y + font_tile_h, x:x +
                    font_tile_w] = font_tile_seq[candidate]

    return ascii_frame


# Setup the preview window
window_name = "Preview"
cv2.namedWindow(window_name, cv2.WINDOW_NORMAL)
cv2.resizeWindow(window_name, cap_w, cap_h)
cv2.moveWindow(window_name, 0, 0)

# Read the video
while(cap.isOpened()):
    # Capture frame-by-frame
    ret, frame = cap.read()
    if ret == True:

        # Convert to ASCII and save
        edges_frame = generate_edge_frame(frame)
        ascii_frame = generate_ascii_frame(edges_frame)
        out.write(ascii_frame)

        # Display the resulting images
        images = np.vstack((edges_frame, ascii_frame))
        cv2.imshow(window_name, images)

        # Press 'q' on keyboard to quit
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # Break the loop
    else:
        break

# When everything done, release the video capture object
cap.release()
out.release()

# Closes all the frames
cv2.destroyAllWindows()
