module App.Flags exposing (..)

import Lib.Gitea

type alias Flags =
    { gitea : Lib.Gitea.Gitea
    }
