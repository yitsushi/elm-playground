module App.Types exposing
    ( Flags
    , Model
    , Msg(..)
    , Route(..)
    , SignIn(..)
    , routeToString
    )

import Browser
import Browser.Navigation exposing (Key)
import Http
import Lib.OAuth
import Url


type SignIn
    = SignInMain
    | SignInCallback (Maybe String)


type Route
    = SignInPage SignIn
    | MainPage
    | NotFound


type alias Model =
    { navigationKey : Key
    , page : Route
    }


type alias Flags =
    { storedToken : Maybe String
    , tmp : String
    }


type Msg
    = NoOp
    | NavigareTo String
    | UrlChanged Url.Url
    | UrlRequest Browser.UrlRequest
    | AccessTokenLanded (Result Http.Error Lib.OAuth.AccessToken)


routeToString : Route -> String
routeToString route =
    case route of
        MainPage ->
            "Main"

        SignInPage _ ->
            "SignIn"

        NotFound ->
            "NotFound"
