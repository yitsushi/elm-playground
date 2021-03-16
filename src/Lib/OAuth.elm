module Lib.OAuth exposing
  ( authorizeURL
  , accessTokenURL
  , Token ( .. )
  , AccessToken
  , maybeTokenToString
  , requestAccessToken
  )

import Http exposing (get)
import Json.Decode exposing (Decoder)

import Configuration.OAuth

type alias AccessToken =
  { accessToken : String
  , tokenType : String
  , expiresIn : Int
  , refreshToken : String
  }

type Token = Code String

type alias URLParameter = 
  { key : String
  , value: String }

authorizeURL : String
authorizeURL = 
  String.join ""
    [ Configuration.OAuth.authServer
    , Configuration.OAuth.authorizePath
    , "?"
    , paramsToString
      [ { key = "client_id", value = Configuration.OAuth.clientID }
      , { key = "redirect_uri", value = Configuration.OAuth.redirectURI }
      , { key = "response_type", value = "code" }
      , { key = "state", value = "" }
      ]
    ]

accessTokenURL : String -> String
accessTokenURL code =
  String.join ""
    [ Configuration.OAuth.authServer
    , Configuration.OAuth.accessTokenPath
    , "?"
    , paramsToString
      [ { key = "client_id", value = Configuration.OAuth.clientID }
      , { key = "redirect_uri", value = Configuration.OAuth.redirectURI }
      , { key = "grant_type", value = "code" }
      , { key = "code", value = code }
      ]
    ]

paramsToString : List URLParameter -> String
paramsToString params =
  List.map (\param -> param.key ++ "=" ++ param.value) params |> String.join "&"

maybeTokenToString : Maybe Token -> String
maybeTokenToString token =
  case token of
    Just (Code s) -> s
    Nothing -> "Undefined"

requestAccessToken : (Result Http.Error AccessToken -> a) -> String -> Cmd a
requestAccessToken msg token =
  Http.get
    { url = accessTokenURL (token)
    , expect = Http.expectJson msg accessTokenDecoder
    }

accessTokenDecoder : Decoder AccessToken
accessTokenDecoder = Json.Decode.map4 AccessToken
  (Json.Decode.field "access_token" Json.Decode.string)
  (Json.Decode.field "token_type" Json.Decode.string)
  (Json.Decode.field "expires_in" Json.Decode.int)
  (Json.Decode.field "refresh_token" Json.Decode.string)