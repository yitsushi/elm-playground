module Page.SignIn.Model exposing (..)

import App.Flags exposing (Flags)
import Lib.Gitea


type alias Model =
    { gitea : Lib.Gitea.Gitea
    , code : Maybe String
    , accessToken : Maybe String
    }


initialModel : Flags -> Model
initialModel flags =
    { code = Nothing
    , accessToken = Nothing
    , gitea = flags.gitea
    }
