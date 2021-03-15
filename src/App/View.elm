module App.View exposing (view)

import Browser exposing (Document)
import Html

import App.Types exposing (..)

view : Model -> Document Msg
view _ =
  { title = "My Title"
  , body = [
      Html.p [] [ Html.text "Hello o/"]
    ]
  }