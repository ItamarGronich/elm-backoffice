module App.View exposing (..)

import App.Model exposing (..)
import App.Update exposing (..)
import Html exposing (h1, text, ul, li, div, button)
import Html.Events exposing (onClick)


view : Model -> Html.Html Msg
view model =
    div []
        [ h1 []
            [ text (toString model.activePage) ]
        , ul []
            (List.map
                genLi
                [ "Sales", "Items", "Clients" ]
            )
        ]


genLi : String -> Html.Html Msg
genLi textContent =
    li [] [ button [ onClick (SetActivePage <| encodePage textContent) ] [ text textContent ] ]
