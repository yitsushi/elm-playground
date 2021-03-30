module Main exposing (..)

import Browser exposing (Document)
import Browser.Navigation exposing (Key)
import Html
import Html.Attributes
import Html.Events
import Task
import Url exposing (Url)
import Process


type alias Model =
    { input : String
    , output : String
    }


type alias Flags =
    {}


type Message
    = Noop
    | SaveInput String
    | StartProcess
    | ProcessDone String


main : Program Flags Model Message
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = \_ -> Noop
        , onUrlRequest = \_ -> Noop
        }


init : Flags -> Url -> Key -> ( Model, Cmd Message )
init _ _ _ =
    ( { input = "", output = "" }, Cmd.none )


update : Message -> Model -> ( Model, Cmd Message )
update msg m =
    case msg of
        Noop ->
            ( m, Cmd.none )

        SaveInput val ->
            ( { m | input = val }, Cmd.none )

        StartProcess ->
            ( { m | output = "please wait..." }, processor ProcessDone m.input )

        ProcessDone val ->
            ( { m | output = val }, Cmd.none )


processor : (String -> msg) -> String -> Cmd msg
processor wrap str =
    Process.sleep 1000 |>
      Task.perform (\_ -> wrap <| String.join " " <| List.map String.reverse <| String.words <| String.reverse str)

view : Model -> Document Message
view m =
    { title = "My Title"
    , body =
        [ Html.div [] [ Html.text "Title" ]
        , Html.div []
            [ Html.input [ Html.Attributes.placeholder "type something...", Html.Events.onInput SaveInput ] []
            , Html.button [ Html.Events.onClick StartProcess ] [ Html.text "Process" ]
            ]
        , Html.div [] [ Html.text <| "Input: " ++ m.input ]
        , Html.div [] [ Html.text <| "Output: " ++ m.output ]
        ]
    }
