module Main where

import Control.Concurrent (threadDelay)
import Control.Monad (forM_)
import System.IO (hFlush, stdout)

type Cell = (Int, Int)
type Board = [[Bool]]

width, height :: Int
width = 20
height = 15

glider :: [Cell]
glider = [(1, 0), (2, 1), (0, 2), (1, 2), (2, 2)]

blinker :: [Cell]
blinker = [(10, 5), (11, 5), (12, 5)]

initialCells :: [Cell]
initialCells = glider ++ blinker

emptyBoard :: Board
emptyBoard = replicate height (replicate width False)

seedBoard :: [Cell] -> Board
seedBoard cells =
  [ [ (c, r) `elem` cells | c <- [0 .. width - 1] ]
  | r <- [0 .. height - 1] ]

neighbors :: Board -> Int -> Int -> Int
neighbors board r c = length
  [ () | dr <- [-1, 0, 1], dc <- [-1, 0, 1]
       , (dr, dc) /= (0, 0)
       , let nr = r + dr
       , let nc = c + dc
       , nr >= 0, nr < height
       , nc >= 0, nc < width
       , board !! nr !! nc ]

step :: Board -> Board
step board =
  [ [ nextCell (board !! r !! c) (neighbors board r c)
    | c <- [0 .. width - 1] ]
  | r <- [0 .. height - 1] ]
  where
    nextCell alive n
      | alive && (n == 2 || n == 3) = True
      | not alive && n == 3         = True
      | otherwise                   = False

render :: Board -> String
render board = unlines [ [ if cell then '#' else '.' | cell <- row ] | row <- board ]

main :: IO ()
main = loop (seedBoard initialCells) 0
  where
    loop board gen
      | gen >= 50 = putStrLn "Done."
      | otherwise = do
          putStr "\ESC[2J\ESC[H"
          putStrLn ("Generation " ++ show gen)
          putStr (render board)
          hFlush stdout
          threadDelay 200000 
          loop (step board) (gen + 1)