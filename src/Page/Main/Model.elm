module Page.Main.Model exposing (..)

type alias Model =
    { status : String
    , message : String
    }


initialModel : Model
initialModel =
  { status = "test"
  , message = "initial message"}