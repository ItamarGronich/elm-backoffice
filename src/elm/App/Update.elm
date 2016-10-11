module App.Update exposing (..)

import App.Model exposing (..)


type Msg
    = SetActivePage Page


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetActivePage page ->
            ( { model | activePage = page }, Cmd.none )
