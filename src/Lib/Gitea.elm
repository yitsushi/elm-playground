module Lib.Gitea exposing (..)

import Lib.Http
import Http
import Json.Decode exposing (Decoder)

type alias Gitea =
    { clientID : String
    , redirectURI : String
    , authServer : String
    , authorizePath : String
    , accessTokenPath : String
    }

authorizeURL : Gitea -> String
authorizeURL gitea =
    String.join ""
        [ gitea.authServer
        , gitea.authorizePath
        , "?"
        , Lib.Http.paramsToString
            [ { key = "client_id", value = gitea.clientID }
            , { key = "redirect_uri", value = gitea.redirectURI }
            , { key = "response_type", value = "code" }
            , { key = "state", value = "" }
            ]
        ]

accessTokenURL : Gitea -> String -> String
accessTokenURL gitea code =
    String.join ""
        [ gitea.authServer
        , gitea.accessTokenPath
        , "?"
        , Lib.Http.paramsToString
            [ { key = "client_id", value = gitea.clientID }
            , { key = "redirect_uri", value = gitea.redirectURI }
            , { key = "grant_type", value = "code" }
            , { key = "code", value = code }
            ]
        ]

type alias AccessToken =
    { accessToken : String
    , tokenType : String
    , expiresIn : Int
    , refreshToken : String
    }

type Token
    = Code String

maybeTokenToString : Maybe Token -> String
maybeTokenToString token =
    case token of
        Just (Code s) ->
            s

        Nothing ->
            "Undefined"


requestAccessToken : Gitea -> (Result Http.Error AccessToken -> a) -> String -> Cmd a
requestAccessToken gitea msg token =
    Http.get
        { url = accessTokenURL gitea token
        , expect = Http.expectJson msg accessTokenDecoder
        }

accessTokenDecoder : Decoder AccessToken
accessTokenDecoder =
    Json.Decode.map4 AccessToken
        (Json.Decode.field "access_token" Json.Decode.string)
        (Json.Decode.field "token_type" Json.Decode.string)
        (Json.Decode.field "expires_in" Json.Decode.int)
        (Json.Decode.field "refresh_token" Json.Decode.string)
