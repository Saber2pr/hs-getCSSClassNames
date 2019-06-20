-- saber2pr 2019-06-20T23:26:00.079Z
module Main where

import System.Environment (getArgs)
import GetClassNames (getClassNames)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [input] -> do
      text <- readFile input
      print (getClassNames text)
    _ -> print "input one argument please"
