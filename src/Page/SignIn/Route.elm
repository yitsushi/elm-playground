module Page.SignIn.Route exposing (route)

import Url.Parser as Parser exposing ( (</>) )

import App.Types exposing (Route( .. ))

route : List (Parser.Parser (Route -> a) a)
route =
  [ Parser.map SignInPage (Parser.s "signin" </> Parser.string)
  ]