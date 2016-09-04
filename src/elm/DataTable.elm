module DataTable exposing (..)

import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import String
import Table


-- MODEL


type alias Model =
    { sales : List Sale
    , tableState : Table.State
    , query : String
    }


init : List Sale -> ( Model, Cmd Msg )
init sales =
    let
        model =
            { sales = sales
            , tableState = Table.initialSort "ID"
            , query = ""
            }
    in
        ( model, Cmd.none )



-- UPDATE


type Msg
    = SetQuery String
    | SetTableState Table.State


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetQuery newQuery ->
            ( { model | query = newQuery }
            , Cmd.none
            )

        SetTableState newState ->
            ( { model | tableState = newState }
            , Cmd.none
            )



-- VIEW


view : Model -> Html Msg
view { sales, tableState, query } =
    let
        lowerQuery =
            String.toLower query

        acceptablePeople =
            List.filter (String.contains lowerQuery << String.toLower << .title) sales
    in
        div []
            [ h1 [] [ text "Sales" ]
            , input [ placeholder "Search by Name", onInput SetQuery ] []
            , Table.view config tableState acceptablePeople
            ]


config : Table.Config Sale Msg
config =
    Table.config
        { toId = .title
        , toMsg = SetTableState
        , columns =
            [ Table.intColumn "ID" .saleId
            , Table.stringColumn "Status" .status
            , Table.stringColumn "Title" .title
            , Table.stringColumn "Type" .saleType
            ]
        }



-- PEOPLE


type alias Sale =
    { saleId : Int
    , status : String
    , title : String
    , saleType : String
    }


sales : List Sale
sales =
    [ Sale 1732 "George Washington" "Westmoreland County" "Virginia"
    ]
