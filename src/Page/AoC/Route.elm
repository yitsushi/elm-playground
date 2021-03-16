module Page.AoC.Route exposing (route)

import App.Types exposing (Route(..))
import Url.Parser as Parser exposing ((</>), top)


route : Parser.Parser (Route -> a) a
route =
    Parser.s "aoc" </> Parser.oneOf
    [ Parser.map AdventOfCode2020 Parser.string
    , Parser.map (AdventOfCode2020 "-") Parser.top
    ]
