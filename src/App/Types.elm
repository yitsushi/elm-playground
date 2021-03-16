module App.Types exposing
  ( Flags
    , Model
    , Token ( .. )
    , Msg ( .. )
    , Route ( .. )
    , routeToString
    , maybeTokenToString
  )

import Browser
import Browser.Navigation exposing (Key)
import Url

type Token = Token String

type Route
  = SignInPage String
  | MainPage
  | NotFound

type alias Model = 
  { token: Maybe Token
  , navigationKey: Key
  , page: Route }

type alias Flags =
  { storedToken : Maybe String
  , tmp : String
  }

type Msg =
    NoOp
  | NavigareTo String
  | UrlChanged Url.Url
  | UrlRequest Browser.UrlRequest

routeToString : Route -> String
routeToString route =
  case route of
    MainPage -> "Main"
    SignInPage _ -> "SignIn"
    NotFound -> "NotFound"

maybeTokenToString : Maybe Token -> String
maybeTokenToString token =
  case token of
    Just (Token s) -> s
    Nothing -> "Undefined"