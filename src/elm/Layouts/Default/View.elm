module Layouts.Default.View exposing (..)

import Html exposing (body, header, footer, main', h1, text)
import App.Model exposing (..)
import App.Update exposing (..)
import Menu.View exposing (menu)


view : Model -> List (Html.Html Msg)
view model =
    [ header [] [ (menu model), (h1 [] [ text (toString model.activePage) ]) ]
    , main' [] []
    , footer [] [ text "A Foo-ter" ]
    ]
