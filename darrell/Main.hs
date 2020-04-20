module Main where

import System.Console.ANSI
import Data.List
import Movie
import Sprites



main:: IO()
main = do
  hideCursor
  playMovie movie
  showCursor
