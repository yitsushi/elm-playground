module Page.SignIn.Route exposing (route)

import App.Types exposing (Route(..), SignIn(..))
import Url.Parser as Parser exposing ((</>), (<?>))
import Url.Parser.Query as Query


route : Parser.Parser (Route -> a) a
route = Parser.map SignInPage <| Parser.s "signin" </> Parser.oneOf
    [ Parser.map SignInMain Parser.top
    , Parser.map SignInCallback (Parser.s "callback" <?> Query.string "code")
    ]
