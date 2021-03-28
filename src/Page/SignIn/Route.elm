module Page.SignIn.Route exposing (..)

import Url.Parser as Parser exposing (top, (</>), (<?>))
import Url.Parser.Query as Query


type Route
    = Root
    | Callback (Maybe String)

route : Parser.Parser (Route -> a) a
route =
    Parser.s "signin" </> Parser.oneOf
    [ Parser.map Callback (Parser.s "callback" <?> Query.string "code")
    , Parser.map Root top
    ]