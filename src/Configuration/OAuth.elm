module Configuration.OAuth exposing
    ( accessTokenPath
    , applicationName
    , authServer
    , authorizePath
    , clientID
    , redirectURI
    )


clientID : String
clientID =
    "5eeec0c2-eb26-4cf4-8101-67c76c69cf50"


applicationName : String
applicationName =
    "elm-playground"


redirectURI : String
redirectURI =
    "http://localhost:8000/signin/callback"


authServer : String
authServer =
    "https://gitea.code-infection.com"


authorizePath : String
authorizePath =
    "/login/oauth/authorize"


accessTokenPath : String
accessTokenPath =
    "/login/oauth/access_token"
