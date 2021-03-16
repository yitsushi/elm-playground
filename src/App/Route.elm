module App.Route exposing
    ( onUrlChange
    , onUrlRequest
    , parsedUrl
    , routeParser
    )

import App.Types exposing (Msg(..), Route(..))
import Browser exposing (UrlRequest)
import Page.Main.Route
import Page.SignIn.Route
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), top)


routeParser : Parser.Parser (Route -> a) a
routeParser =
    [ Page.SignIn.Route.route ] ++ Page.Main.Route.route |> Parser.oneOf


parsedUrl : Url -> Route
parsedUrl url =
    Maybe.withDefault NotFound (Parser.parse routeParser url)


onUrlRequest : UrlRequest -> Msg
onUrlRequest =
    UrlRequest


onUrlChange : Url -> Msg
onUrlChange =
    UrlChanged
