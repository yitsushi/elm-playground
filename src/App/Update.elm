module App.Update exposing (update)

import App.Types exposing (Model, Msg(..))

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )