module Movie(
  movie,
  playMovie
  ) where

import Sprites
import Data.List
import System.Console.ANSI
import Control.Concurrent

subtitleY = 21

movie :: [Screen]
movie = [
  drawSprite iSprite 37 letterTop $  bground, -- 1
  drawSprite iSprite 37 letterTop $  bground, 
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground, -- 10
  drawSprite iSprite 37 letterTop $  bground, 
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 125 12 $  bground, -- 20
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 121 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 119 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 117 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 115 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 116 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 113 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 111 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 110 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 109 12 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 109 12 $  bground, -- 30
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 108 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 108 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 104 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 101 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 101 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 99 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 98 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 96 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 94 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 94 9 $  bground, -- 40
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 93 10 $  bground, 
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 91 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 91 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 91 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 89 14 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 89 14 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 86 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 81 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 81 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 76 10 $  bground, -- 50
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 74 9 $  bground, 
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 71 9 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 70 9 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 70 9 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 68 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 68 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 68 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 63 14 $  bground,  -- preparing to spring
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 61 12 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 58 10 $  bground, -- 60
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 55 10 $  bground, 
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 54 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 53 10 $  bground, -- turning to look at I
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 51 9 $  bground, -- looking at I
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 48 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 48 10 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 47 11 $  bground, -- touching down
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 44 11 $  bground, -- flat on ground
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 42 13 $  bground, -- compressed
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 40 11 $  bground, -- 70 -- taking off again
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 36 11 $  bground, 
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 34 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 32 11 $  bground, -- touching down
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 30 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 30 12 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 28 13 $  bground, -- fully compressed, facing backward
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground, -- 80 -- turning to face I
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground, -- facing I
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxo1 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- I is illuminated
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- 90
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- stood up slightly
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- 100
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- turned body to face I
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- 110
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, 
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, -- 120
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground, 
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 13 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 14 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 14 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 27 14 $  bground,
  drawSprite iSpriteLit 37 letterTop $  drawSprite luxoRev 25 14 $  bground, -- beginning Jump
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 25 13 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 25 11 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 25 9 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 27 6 $  bground, -- 130
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 28 5 $  bground, 
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 30 5 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 31 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 31 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 32 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 7 $  bground, -- landed on I
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 7 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 8 $  bground, -- top of I under base of luxo
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 9 $  bground, -- compressing for jump
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 9 $  bground, -- 140 
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 10 $  bground, -- compressed for jump
  drawSprite iSprite 37 15 $  drawSprite luxoRev 34 8 $  bground, -- I extended, luxo jumpint
  drawSprite iSprite 37 15 $  drawSprite luxoRev 34 5 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 5 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 6 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 7 $  bground,  -- overlapping with top of I.
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 7 $  bground, -- 150
  drawSprite iSpriteShortester 37 18 $ drawSprite luxoRev 34 11 $  bground, -- I compressed
  drawSprite iSpriteShortester 37 18 $  drawSprite luxoRev 34 11 $  bground,
  drawSprite iSpriteShortest 37 17 $  drawSprite luxoRev 34 10 $  bground,
  drawSprite iSpriteShortest 37 17 $  drawSprite luxoRev 34 10 $  bground,
  drawSprite iSpriteTall 37 14 $  drawSprite luxoRev 34 7 $  bground, -- tall I
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 5 $  bground,
  drawSprite iSpriteShorter 37 16 $  drawSprite luxoRev 34 5 $  bground, -- SHORT I
  drawSprite iSpriteShorter 37 16 $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSpriteShorter 37 16 $  drawSprite luxoRev 34 5 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 5 $  bground, -- 160
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 7 $  bground, --landing on I again
  drawSprite iSpriteShorter 37 17 $  drawSprite luxoRev 34 10 $  bground,
  drawSprite iSpriteShortester 37 18 $  drawSprite luxoRev 34 11 $  bground,
  drawSprite iSpriteShortester 37 18 $  drawSprite luxoRev 34 11 $  bground,
  drawSprite iSpriteShortester 37 18 $  drawSprite luxoRev 34 11 $  bground,
  drawSprite iSpriteShortest 37 17 $  drawSprite luxoRev 34 10 $  bground,
  drawSprite iSpriteTall 37 15 $  drawSprite luxoRev 34 7 $  bground,
  drawSprite iSprite 37 letterTop $drawSprite luxoRev 34 6 $  bground,
  drawSprite iSprite 37 letterTop $ drawSprite luxoRev 34 6 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 5 $  bground, -- 170
  drawSprite iSpriteTall 37 14 $  drawSprite luxoRev 34 5 $  bground, -- TALL I
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSpriteShorter 37 17 $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 4 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 8 $  bground, -- landing on I again base overlapping with I
  drawSprite iSpriteShortester 37 18 $ drawSprite luxoRev 34 11 $  bground, -- compressed I
  drawSprite iSpriteShortester 37 18 $ drawSprite luxoRev 34 11 $  bground,
  drawSprite iSpriteShortester 37 18 $  drawSprite luxoRev 34 12 $  bground,
  drawSprite iSpriteShortest 37 17 $  drawSprite luxoRev 34 10 $  bground, -- 180
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 7 $  bground, 
  drawSprite iSpriteTall 37 15 $  drawSprite luxoRev 34 0 $  bground, -- tall I
  drawSprite iSpriteTall 37 15 $  drawSprite luxoRev 34 0 $  bground, -- tall I
  drawSprite iSpriteShorter 37 16 $  drawSprite luxoRev 34 0 $  bground, -- short I
  drawSprite iSpriteShorter 37 16 $  drawSprite luxoRev 34 (-1) $  bground,
  drawSprite iSpriteTall 37 14 $  drawSprite luxoRev 34 (-1) $  bground, -- tall I
  drawSprite iSpriteTall 37 14 $  drawSprite luxoRev 34 (-1) $  bground, -- tall I
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 0 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 0 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 1 $  bground, -- 190
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 1 $  bground, 
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 2 $  bground,
  drawSprite iSprite 37 letterTop $  drawSprite luxoRev 34 8 $  bground, -- bye bye I
  drawSprite iSpriteShortester 37 18 $ drawSprite luxoRev 34 12 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground, -- 200
  drawSprite luxoRev 34 13 $  bground, 
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground, -- looks down
  drawSprite luxoRev 34 13 $  bground, -- 210
  drawSprite luxoRev 34 13 $  bground, 
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground, -- still looking down, but starting to turn front.
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground, -- 220
  drawSprite luxoRev 34 13 $  bground, 
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,  -- looking down front
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,  -- looking back to right
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground, -- 230
  drawSprite luxoRev 34 13 $  bground, 
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground, -- 240
  drawSprite luxoRev 34 13 $  bground, 
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite luxoRev 34 13 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- 250 -  animation studios appears, lamp turns forward
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, 
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- 260 -- lamp facing forward
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, 
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- 270
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, 
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- 280
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, 
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fadeLower $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- begin to fade
  fadeLower $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fadeLower $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- 290
  fadeLower $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, 
  fadeLower $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fadeLower $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade ':' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade ':' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade ':' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade ':' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade ':' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade '.' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade '.' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, -- 300
  fade '.' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground, 
  fade '.' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade '.' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground,
  fade ' ' $ drawSprite subtitle 78 subtitleY $ drawSprite luxoFwd 34 12 $  bground
  ]

playMovie :: [Screen] -> IO ()
playMovie screens = do
  let frames = map render screens
  mapM ( \ frame -> do 
    setCursorPosition 0 0 
    putStr frame
    threadDelay 17000
    ) frames
  return ()