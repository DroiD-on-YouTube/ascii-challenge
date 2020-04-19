module Main where

import Data.Char
import System.Console.ANSI

type Screen = [ String ]
data Sprite = SPRITE { width:: Int, height:: Int, image::[ String ] }
  deriving (Show)

type Xpos = Int 
type Ypos = Int 

screenWidth, screenHeight:: Int 
screenWidth = 118
screenHeight = 26

render:: Screen -> IO ()
render screen = do 
  setCursorPosition 0 0 
  putStr $ unlines screen 

-- | Pad an image by adding empty rows and columns to the right and bottom.
pad :: Int -> Int -> [String] ->  [String]
pad = padWith ' '

padWith :: Char -> Int -> Int -> [String] ->  [String]
padWith c w h img = 
   let img' = take h (map (\ row -> take w $ row++repeat c ) ( img ++ repeat ""))
   in  img'

padSprite:: Sprite -> Sprite 
padSprite sprite = SPRITE { 
    width = width sprite,
    height = height sprite,
    image = pad (width sprite) (height sprite) (image sprite)
  }

blankline:: String 
blankline = take screenWidth $ repeat ' ' 

blankLines:: Int -> [String]
blankLines n = take n $ repeat blankline

blankScreen :: Screen 
blankScreen = blankLines screenHeight 

drawSprite :: Sprite -> Xpos -> Ypos -> Screen -> Screen
drawSprite sprite x y screen = 
  let sprite' = trimX $ trimY sprite 
      trimX = if (x<0) 
                then trimLeft (-x)
                else if (x+width sprite > screenWidth)
                        then trimRight (x+width sprite - screenWidth)
                        else id 
      trimY = if (y<0) 
                then trimTop (-y)
                else if (y+height sprite > screenHeight)
                        then trimBot (y+height sprite - screenHeight)
                        else id 
      (above,incidentAndBelow) = splitAt y screen
      (incident,below) = splitAt (height sprite') $ incidentAndBelow
      incident' = zipWith (\ screenrow spriterow -> 
        let (left,rest) = splitAt x screenrow 
            (zz,right) = splitAt (length spriterow) rest
            zz' = zipWith (\ o s -> if s==' ' then o else s) zz spriterow
        in  left ++ zz' ++ right
        ) incident (image sprite')
  in  above ++ incident' ++ below 

-- | Slice the sprite horizontally, discarding all the rows at or above the
-- the given index
trimTop :: Int -> Sprite -> Sprite 
trimTop y sprite = 
  let w = width sprite 
      h = height sprite
      img = image sprite
      img' = map (drop y) img
      h'   = max 0 (min h (h-y))
  in  SPRITE { height = h', width = w, image = img'}


-- | Slice the sprite horizontally, discarding all the rows at or below the
-- the given index
trimBot :: Int -> Sprite -> Sprite 
trimBot y sprite = 
  let h = height sprite 
      w = width sprite
      img = image sprite
      h'  = max 0 (min h (h-y)) 
      img' = take h' img
  in  SPRITE {height=h', width = w, image =img' }

-- | Slice the sprite vertically, discarding all the columns at or to the left
-- of the given index
trimLeft :: Int -> Sprite -> Sprite 
trimLeft x sprite = 
  let w = width sprite 
      h = height sprite
      img = image sprite
      img' = map (drop x) img
      w'   = max 0 (min w (w-x))
  in  SPRITE { height = h, width = w', image = img'}

-- | Slice the sprite vertically, discarding all columns at or to the right 
-- the given index
trimRight :: Int -> Sprite -> Sprite
trimRight x sprite =
   let h = height sprite
       w = width sprite
       img = image sprite
       img' = map (take (x-1)) img
       w'   = max 0 (min w (x-1))
   in  SPRITE { height= h, width= w', image =img'}

 
pSprite = padSprite $ SPRITE { height = 5, width = 6, image = ["pPPPP"," P   P"," PPPP"," P","pPp"]}
iSprite = padSprite $ SPRITE { height = 5, width = 6, image = ["IIIII","  I","  I","  I","IIIII"]}
xSprite = padSprite $ SPRITE { height = 5, width = 10, image = ["xXx   xXx","  Xx  X","    Xx","  X   Xx","xXx     xX"]}
aSprite = padSprite $ SPRITE { height = 5, width = 11, image = ["   aaAaa","    A A","   AAAAA","  A     A","aAa     aAa"]}
rSprite = padSprite $ SPRITE { height = 5, width = 7, image = ["rRRRR"," R   R"," RRRR"," R   R","rR    R"]} 
bground = 
  drawSprite pSprite 12 10 $
  drawSprite iSprite 31 10 $
  drawSprite xSprite 49 10 $
  drawSprite aSprite 71 10 $
  drawSprite rSprite 96 10 $
  padWith ' ' screenWidth screenHeight []

uparrow:: Char
uparrow = toEnum 24

clearscreen :: String 
clearscreen = take 26 ( repeat uparrow )

foo :: Sprite 
foo = padSprite $ SPRITE 5 3 [
  "+---+",
  "|   |",
  "+---+"
  ]

bar :: Sprite 
bar = padSprite $ SPRITE 1 1 [
  "+"
  ]

baz :: Sprite 
baz = padSprite $ SPRITE 5 3 []

main:: IO()
main = do
  hideCursor :: IO ()
  let screen = drawSprite baz 51 13 $ 
        drawSprite baz (-2) 13 $
        drawSprite baz 51 (0) $
        drawSprite baz 51 24 $
        drawSprite baz 116 13 bground
  render screen
  
  -- if character is waiting, then end the video and reset the cursor
  -- main
   




