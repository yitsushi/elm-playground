module Global.Model exposing (..)

import Browser.Navigation exposing (Key)
import App.Route
import Url exposing (Url)
import App.Router

type alias Model =
  { navigationKey : Key
  , debug : Bool
  , page : App.Route.Route
  }

initialModel : Key -> Url -> Model
initialModel key url =
  { navigationKey = key
  , debug = False
  , page = App.Router.parsedUrl url
  }