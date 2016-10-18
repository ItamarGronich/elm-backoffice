module App.View exposing (..)

import App.Model exposing (..)
import App.Update exposing (..)
import Html exposing (h1, text, ul, li, div, button)
import Menu.View exposing (menu)


view : Model -> Html.Html Msg
view model =
    div []
        [ (menu model)
        , h1 [] [ text (toString model.activePage) ]
        ]
