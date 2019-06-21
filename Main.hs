-- saber2pr 2019-06-20T23:26:00.079Z
module Main where

import System.Environment (getArgs)
import GetClassNames (getClassNames)

main :: IO ()
-- 1. do block is same to `async/await`, but how about `>>=` which maybe look like callbackify.
-- main = do
--   args <- getArgs
--   case args of
--     [input] -> do
--       text <- readFile input
--       print (getClassNames text)
--     _ -> print "input one argument please"

-- 2. use `>>=`, it's pretty, but it's hard to understand.
main = getArgs >>=
  (\args -> case args of
              [input] ->
                readFile input >>=
                  print . getClassNames
              _ -> print "input one argument please")
