module App.Route exposing
  ( Route(..)
  , routeParser
  , parsedUrl
  , onUrlRequest
  , onUrlChange
  )

import Browser exposing (UrlRequest)
import Url exposing (Url)
import Url.Parser as Parser exposing ( (</>) )

import App.Types exposing (Msg(..))

type Route
  = Signin String
  | NotFound

routeParser : Parser.Parser (Route -> a) a
routeParser = Parser.oneOf
  [ Parser.map Signin (Parser.s "signin" </> Parser.string)
  ]

parsedUrl : Url -> Route
parsedUrl url = Maybe.withDefault NotFound (Parser.parse routeParser url)

onUrlRequest : UrlRequest -> Msg
onUrlRequest _ = NoOp

onUrlChange : Url -> Msg
onUrlChange _ = NoOp
