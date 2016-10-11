module App.Model exposing (..)


type Page
    = Sales
    | Items
    | Clients


type alias Model =
    { activePage : Page }


initialModel : Model
initialModel =
    { activePage = Sales }
