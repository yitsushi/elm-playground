module Page.AoC.Route exposing (..)

import Url.Parser as Parser exposing (top, (</>))

type Route
    = Root
    | Solution Int

route : Parser.Parser (Route -> a) a
route =
    Parser.s "aoc" </> Parser.oneOf
    [ Parser.map Solution (top </> Parser.int)
    , Parser.map Root top
    ]
