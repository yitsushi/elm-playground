module Page.Main.Route exposing (route)

import Url.Parser as Parser exposing ( top )

import App.Types exposing (Route( .. ))

route : List (Parser.Parser (Route -> a) a)
route = [ Parser.map MainPage top ]