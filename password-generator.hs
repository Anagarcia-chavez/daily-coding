module Main where

import System.Random (randomRIO)
import Control.Monad (replicateM)
import Data.List (nub)

lowerChars, upperChars, digitChars, symbolChars :: String
lowerChars  = ['a'..'z']
upperChars  = ['A'..'Z']
digitChars  = ['0'..'9']
symbolChars = "!@#$%^&*()-_=+[]{}"

data Options = Options
  { optLength  :: Int
  , optLower   :: Bool
  , optUpper   :: Bool
  , optDigits  :: Bool
  , optSymbols :: Bool
  }

charPool :: Options -> String
charPool opts = concat $ filter (not . null)
  [ if optLower opts   then lowerChars  else ""
  , if optUpper opts   then upperChars  else ""
  , if optDigits opts  then digitChars  else ""
  , if optSymbols opts then symbolChars else ""
  ]

genPassword :: Options -> IO String
genPassword opts = do
  let pool = charPool opts
  if null pool
    then return ""
    else replicateM (optLength opts) (randomChar pool)

randomChar :: String -> IO Char
randomChar pool = do
  i <- randomRIO (0, length pool - 1)
  return (pool !! i)

askYesNo :: String -> IO Bool
askYesNo prompt = do
  putStrLn (prompt ++ " (y/n)")
  answer <- getLine
  case answer of
    "y" -> return True
    "n" -> return False
    _   -> do
      putStrLn "Please enter y or n."
      askYesNo prompt

main :: IO ()
main = do
  putStrLn "Password length:"
  lengthInput <- getLine
  let len = case reads lengthInput of
        [(n, "")] -> n
        _         -> 12

  useLower   <- askYesNo "Include lowercase letters?"
  useUpper   <- askYesNo "Include uppercase letters?"
  useDigits  <- askYesNo "Include digits?"
  useSymbols <- askYesNo "Include symbols?"

  let opts = Options len useLower useUpper useDigits useSymbols
  password <- genPassword opts

  if null password
    then putStrLn "You need to include at least one character type."
    else putStrLn ("Generated password: " ++ password)