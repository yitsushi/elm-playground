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
    | AdventOfCode2020 String
    | MainPage
    | NotFound


type alias Model =
    { navigationKey : Key
    , page : Route
    , adventOfCodeOutput : ( Maybe String, Maybe String )
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
    | AdventOfCodeInputLanded (Result Http.Error String)


routeToString : Route -> String
routeToString route =
    case route of
        MainPage ->
            "Main"

        SignInPage _ ->
            "SignIn"

        NotFound ->
            "NotFound"

        AdventOfCode2020 _ ->
            "Advent of Code 2020"
