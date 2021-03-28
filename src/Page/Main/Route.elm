module Page.Main.Route exposing (..)

import Url.Parser as Parser exposing (top)


type Route
    = Root


route : Parser.Parser (Route -> a) a
route =
    Parser.map Root top
