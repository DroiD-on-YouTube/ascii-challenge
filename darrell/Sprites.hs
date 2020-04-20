module Sprites(
  Screen,
  Sprite,
  height,
  width,
  render,
  padSprite,
  screenHeight,
  screenWidth,
  letterTop,
  drawSprite,
  aSprite, iSprite, luxo1, pSprite, xSprite, rSprite,hruler, vruler, iSpriteLit, subtitle, luxoRev, luxoFwd,
  iSpriteTall, iSpriteShorter, iSpriteShortest, iSpriteShortester,
  bground,
  fadeLower,
  fade
  ) where

import Data.Char
import Data.String 
import Data.List
import System.Console.ANSI

type Screen = [ String ]
data Sprite = SPRITE { width:: Int, height:: Int, image::[ String ] }
  deriving (Show)

type Xpos = Int 
type Ypos = Int 

screenWidth, screenHeight:: Int 
screenWidth = 128
screenHeight = 34
letterTop = 15

render:: Screen -> String
render screen = unlines screen 

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


reverseSprite :: Sprite -> Sprite 
reverseSprite sprite = SPRITE { height = height sprite, width = width sprite, image = map reverse $ image sprite }

luxo1 = padSprite $ SPRITE { height=7, width = 7, image = ["|\\_","| |)","|/  \\","    |\\","   /=/","   \\|"," ======"] } 
luxoFwd = padSprite $ SPRITE { height=8, width = 8, image = ["  ____"," /    \\","|  ()  |"," \\____/"," /|    "," \\=\\","  |/","======"] } 
luxoRev = padSprite $ SPRITE { height=7, width = 7, image = ["     /|","   (| |","  /  \\|"," /|    "," \\=\\","  |/","======"] } 
pSprite = padSprite $ SPRITE { height = 5, width = 6, image = ["pPPPP"," P   P"," PPPP"," P","pPp"]}
iSprite = padSprite $ SPRITE { height = 5, width = 6, image = ["IIIII","  I","  I","  I","IIIII"]}
iSpriteTall = padSprite $ SPRITE { height = 6, width = 6, image = ["IIIII","  |","  |","  |","  |","IIIII"]}
iSpriteShorter = padSprite $ SPRITE { height = 4, width = 6, image = ["IIIII"," iIi"," iIi","IIIII"]}
iSpriteShortest = padSprite $ SPRITE { height = 3, width = 6, image = [" iIi"," iIi","IIIII"]}
iSpriteShortester = padSprite $ SPRITE { height = 3, width = 6, image = [" III","IIIII"]}
iSpriteLit = padSprite $ SPRITE { height = 5, width = 6, image = [":::::","  :","  :","  :",":::::"]}
xSprite = padSprite $ SPRITE { height = 5, width = 10, image = ["xXx   xXx","  XX  X","    Xx","  X   Xx","xXx     x"]}
aSprite = padSprite $ SPRITE { height = 5, width = 11, image = ["   aaAaa","    A A","   AAAAA","  A     A","aAa     aAa"]}
rSprite = padSprite $ SPRITE { height = 5, width = 9, image = ["rRRRRr"," R   Rr"," RRRRr"," R   Rr","rR     Rr"]} 
subtitle = padSprite $ SPRITE { height = 1, width = 32, image = ["A N I M A T I O N  S T U D I O S"]} 
hruler = padSprite $ SPRITE { height = 1, width = screenWidth, image = ["0.........1.........2.........3.........4.........5.........6.........7.........8.........9.........0.........1.........2.........3.........4"] }
vruler = padSprite $ SPRITE { height = screenHeight, width = 1, image = ["0",".",".",".",".",".",".",".",".",".","1",".",".",".",".",".",".",".",".",".","2",".",".",".",".",".",".",".",".",".","3",".",".",".",".",".",".",".",".",".","4"] }

bground:: Screen
bground = 
  drawSprite pSprite 16 letterTop $
  drawSprite xSprite 55 letterTop $
  drawSprite aSprite 78 letterTop $
  drawSprite rSprite 102 letterTop $
  padWith ' ' screenWidth screenHeight []

fadeLower:: Screen -> Screen 
fadeLower = map (map toLower) 

fade:: Char -> Screen -> Screen 
fade c = map (\str -> map ( \k -> if k/=' ' then c else k) str)

