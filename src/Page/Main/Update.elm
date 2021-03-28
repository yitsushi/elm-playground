module Page.Main.Update exposing (..)

import App.Message as Base
import Page.Main.Model exposing (Model)


update : Base.Message -> Model -> ( Model, Cmd Base.Message )
update _ model =
    ( model, Cmd.none )
