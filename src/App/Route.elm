module App.Route exposing
  ( routeParser
  , parsedUrl
  , onUrlRequest
  , onUrlChange
  )

import Browser exposing (UrlRequest)
import Url exposing (Url)
import Url.Parser as Parser exposing ( (</>), top )

import App.Types exposing (Msg(..), Route( .. ))

import Page.Main.Route
import Page.SignIn.Route

routeParser : Parser.Parser (Route -> a) a
routeParser =
  [Page.SignIn.Route.route] ++ Page.Main.Route.route |> Parser.oneOf

parsedUrl : Url -> Route
parsedUrl url = Maybe.withDefault NotFound (Parser.parse routeParser url)

onUrlRequest : UrlRequest -> Msg
onUrlRequest = UrlRequest 

onUrlChange : Url -> Msg
onUrlChange = UrlChanged