-- saber2pr 2019-06-20T23:26:24.207Z
module GetClassNames (getClassNames)
  where

import Text.Regex.Posix
import Data.List.Split
import Data.Char

-- trim :: String -> String
-- trim = filter (not . isSpace)

getClassNames:: String -> [String]
-- 1. \s -> trim s and trim is the same type `String -> String`, \s -> s has no effect.
-- getClassNames text =
--    (map (\s -> trim s)
--     (map (\s -> head (splitOn ":" (init s)))
--       (filter (\s -> (s =~ reg) :: Bool)
--         (lines text))))
--   where
--     reg = "(\\..*(\\{| \\{))"

-- 2. the `$` is so ugly...
-- getClassNames text =
--    (map (filter $ not . isSpace)
--     $ map (\s -> head $ splitOn ":" $ init s)
--     $ filter (\s -> s =~ reg)
--     $ lines text)
--   where
--     reg = "(\\..*(\\{| \\{))"

-- 3. the expression `map ()` return a function, so compose it, like 4.
-- getClassNames text =
--    (map ((\s -> (trim . head . (splitOn ":") . init) s))
--    (filter (\s -> (s =~ reg) :: Bool)
--    (lines text)))
--   where
--     reg = "(\\..*(\\{| \\{))"

-- 4. compose all currys, not use lambda
-- getClassNames =
--    (map $ trim.splitClassName.init)
--   . filter (=~reg)
--   . lines
--   where
--     reg = "(\\..*\\{)"
--     trim = filter $ not.isSpace
--     splitClassName = head.splitOn":"

-- 5. use functor to refact it

getClassNames str =
  let -- create list
      reg = "(\\..*\\{)"
      toLS = filter (=~reg)
            .lines
      ls = toLS str

  in -- list map
  trim <$> className <$> init <$> ls

  where -- operators
    className = head.splitOn ":"
    trim = filter $ not.isSpace
