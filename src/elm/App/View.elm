module App.View exposing (..)

import App.Model exposing (..)
import App.Update exposing (..)
import Html exposing (body)
import Layouts.Default.View as DefaultLayout exposing (view)


view : Model -> Html.Html Msg
view model =
    body []
        (DefaultLayout.view model)
