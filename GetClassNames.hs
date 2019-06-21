-- saber2pr 2019-06-20T23:26:24.207Z
module GetClassNames
  (getClassNames)
  where

import Text.Regex.Posix
import Data.List.Split
import Data.Char

trim :: String -> String
trim = Prelude.filter (not . isSpace)

getClassNames:: String -> [String]
-- getClassNames text =
--    (map (\s -> trim s)
--     (map (\s -> head (splitOn ":" (init s)))
--       (filter (\s -> (s =~ reg) :: Bool)
--         (lines text))))
--   where
--     reg = "(\\..*(\\{| \\{))"
--
-- getClassNames text =
--    (map ((\s -> (trim . head . (splitOn ":") . init) s))
--    (filter (\s -> (s =~ reg) :: Bool)
--    (lines text)))
--   where
--     reg = "(\\..*(\\{| \\{))"
getClassNames =
   ((map (filter (not
                . isSpace)
        . head
        . (splitOn ":")
        . init))
  . filter (=~reg)
  . lines)
  where
    reg = "(\\..*(\\{| \\{))"
