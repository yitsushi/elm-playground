module App.Model exposing (..)

import Global.Model
import Page.AoC.Model
import Browser.Navigation exposing (Key)
import Url exposing (Url)
import Page.Main.Model
import Page.SignIn.Model
import App.Flags exposing (Flags)

type alias Model =
  { global : Global.Model.Model
  , mainPage : Page.Main.Model.Model
  , adventOfCode : Page.AoC.Model.Model
  , signIn : Page.SignIn.Model.Model
  }

initialModel : Flags -> Key -> Url -> Model
initialModel flags key url =
  { global = Global.Model.initialModel key url
  , mainPage = Page.Main.Model.initialModel
  , adventOfCode = Page.AoC.Model.initialModel
  , signIn = Page.SignIn.Model.initialModel flags
  }