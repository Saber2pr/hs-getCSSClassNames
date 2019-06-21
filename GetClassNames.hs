-- saber2pr 2019-06-20T23:26:24.207Z
module GetClassNames
  (getClassNames)
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

-- 2. don's use `$`, it's too ugly!
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
getClassNames =
   ((map (filter (not
                . isSpace)
        . head
        . (splitOn ":")
        . init))
  . filter (=~reg)
  . lines)
  where
    reg = "(\\..*\\{)"
