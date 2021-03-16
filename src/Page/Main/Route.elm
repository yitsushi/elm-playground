module Page.Main.Route exposing (route)

import App.Types exposing (Route(..))
import Url.Parser as Parser exposing (top)


route : List (Parser.Parser (Route -> a) a)
route =
    [ Parser.map MainPage top ]
