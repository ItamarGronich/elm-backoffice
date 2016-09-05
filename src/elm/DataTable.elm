module DataTable exposing (..)

import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import String
import Table
import Date
import Json.Decode exposing (Decoder, int, string, object5, (:=), list)


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

        acceptableSales =
            List.filter (String.contains lowerQuery << String.toLower << .title) sales
    in
        div []
            [ h1 [] [ text "Sales" ]
            , input [ placeholder "Search by Name", onInput SetQuery ] []
            , Table.view config tableState acceptableSales
            ]


config : Table.Config Sale Msg
config =
    Table.config
        { toId = .saleId >> toString
        , toMsg = SetTableState
        , columns =
            [ Table.intColumn "ID" .saleId
            , Table.stringColumn "Status" (.status >> deconstructStatus)
            , Table.stringColumn "Title" .title
            , Table.stringColumn "Type" (.saleType >> deconstructType)
            , Table.stringColumn "Mail Start" (.mailStart >> toDateString)
            ]
        }


toDateString : Date.Date -> String
toDateString date =
    let
        day =
            Date.day date |> toString

        monthToNumber : Date.Month -> String
        monthToNumber stringDate =
            case stringDate of
                Date.Jan ->
                    "01"

                Date.Feb ->
                    "02"

                Date.Mar ->
                    "03"

                Date.Apr ->
                    "04"

                Date.May ->
                    "01"

                Date.Jun ->
                    "02"

                Date.Jul ->
                    "03"

                Date.Aug ->
                    "04"

                Date.Sep ->
                    "09"

                Date.Oct ->
                    "10"

                Date.Nov ->
                    "11"

                Date.Dec ->
                    "12"

        month =
            monthToNumber (Date.month date)

        year =
            Date.year date |> toString
    in
        day ++ "/" ++ month ++ "/" ++ year



-- PEOPLE


type alias Sale =
    { saleId : Int
    , status : SaleStatus
    , title : String
    , saleType : SaleType
    , mailStart : Date.Date
    }


type SaleStatus
    = SaleNew
    | SaleInProcess
    | SalePublishedOnSite


deconstructStatus : SaleStatus -> String
deconstructStatus status =
    case status of
        SaleNew ->
            "New"

        SaleInProcess ->
            "In Process"

        SalePublishedOnSite ->
            "Published On Site"


type SaleType
    = Mail
    | Live
    | MailAndLive


deconstructType : SaleType -> String
deconstructType status =
    case status of
        Mail ->
            "Mail"

        Live ->
            "Live"

        MailAndLive ->
            "Mail & live"


sales : List Sale
sales =
    [ Sale 1732 SaleNew "Sale 1" Mail (Date.fromTime 1472715899000)
    , Sale 1733 SaleInProcess "foo" MailAndLive (Date.fromTime 1483725899000)
    ]


saleObjectDecoder : Decoder Sale
saleObjectDecoder =
    object5 Sale
        ("id" := int)
        ("status" := string)
        ("label" := string)
        ("sale_type" := string)
        ("mail_sale_date_from" := int)


salesDecoder : Decoder (List Sale)
salesDecoder =
    list saleObjectDecoder


salesJson : String
salesJson =
    """
  [{"id":7,"label":{"en":"Sale 5 <script>alert('xss');</script>","he":"מכירה 5"},"published":"1","created":1472384634000,"updated":1472715899000,"author":{"id":null,"label":null,"self":"http://localhost/backoffice/www/drupal/api/v1.0/users/0","mail":null},"status":{"value":"new","label":"New"},"description":{"en":null,"he":null},"subtitle":{"en":null,"he":null},"sale_type":"mail_and_live","bid_steps":null,"logo":{"fid":"5","uid":"0","filename":"sale-logo_3.jpg","uri":"public://sale_covers/sale-logo_3.jpg","filemime":"image/jpeg","filesize":"7805","status":"1","timestamp":"1472384634","alt":null,"title":null,"width":"198","height":"128","url":"https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_3.jpg"},"auctioneer_name":null,"mail_sale_date_from":null,"mail_sale_date_to":null,"live_sale_date_from":null,"live_sale_date_to":null,"buyers_premium":null,"lots_locked":false,"post_sale_discount":"20","sync_item_images":false,"last_item_images_sync":null,"sale_sessions":null,"last_date_for_consignment":null,"sale_number":null,"additional_charges":null},{"id":6,"label":{"en":"Sale 4","he":"מכירה 4"},"published":"1","created":1472384634000,"updated":1472719909000,"author":{"id":null,"label":null,"self":"http://localhost/backoffice/www/drupal/api/v1.0/users/0","mail":null},"status":{"value":"ready_to_publish","label":"Ready to publish"},"description":{"en":null,"he":null},"subtitle":{"en":null,"he":null},"sale_type":"mail_and_live","bid_steps":[{"step":"4","step_from":"0"},{"step":"9","step_from":"24"}],"logo":{"fid":"4","uid":"0","filename":"sale-logo_2.jpg","uri":"public://sale_covers/sale-logo_2.jpg","filemime":"image/jpeg","filesize":"7805","status":"1","timestamp":"1472384634","alt":null,"title":null,"width":"198","height":"128","url":"https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_2.jpg"},"auctioneer_name":null,"mail_sale_date_from":null,"mail_sale_date_to":null,"live_sale_date_from":null,"live_sale_date_to":null,"buyers_premium":null,"lots_locked":false,"post_sale_discount":"20","sync_item_images":false,"last_item_images_sync":null,"sale_sessions":null,"last_date_for_consignment":null,"sale_number":null,"additional_charges":null},{"id":5,"label":{"en":"Sale 3","he":"מכירה 3"},"published":"1","created":1472384634000,"updated":1472385529000,"author":{"id":null,"label":null,"self":"http://localhost/backoffice/www/drupal/api/v1.0/users/0","mail":null},"status":{"value":"ready_to_publish","label":"Ready to publish"},"description":{"en":null,"he":null},"subtitle":{"en":null,"he":null},"sale_type":"mail_and_live","bid_steps":[{"step":"3","step_from":"0"},{"step":"8","step_from":"23"},{"step":"15","step_from":"53"}],"logo":{"fid":"3","uid":"0","filename":"sale-logo_1.jpg","uri":"public://sale_covers/sale-logo_1.jpg","filemime":"image/jpeg","filesize":"7805","status":"1","timestamp":"1472384634","alt":null,"title":null,"width":"198","height":"128","url":"https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_1.jpg"},"auctioneer_name":null,"mail_sale_date_from":null,"mail_sale_date_to":null,"live_sale_date_from":null,"live_sale_date_to":null,"buyers_premium":null,"lots_locked":false,"post_sale_discount":"20","sync_item_images":false,"last_item_images_sync":"1472384677","sale_sessions":null,"last_date_for_consignment":null,"sale_number":null,"additional_charges":null},{"id":4,"label":{"en":"Sale 2","he":"מכירה 2"},"published":"1","created":1472384634000,"updated":1472385491000,"author":{"id":null,"label":null,"self":"http://localhost/backoffice/www/drupal/api/v1.0/users/0","mail":null},"status":{"value":"ready_to_publish","label":"Ready to publish"},"description":{"en":null,"he":null},"subtitle":{"en":null,"he":null},"sale_type":"mail_and_live","bid_steps":[{"step":"2","step_from":"0"},{"step":"15","step_from":"52"}],"logo":{"fid":"2","uid":"0","filename":"sale-logo_0.jpg","uri":"public://sale_covers/sale-logo_0.jpg","filemime":"image/jpeg","filesize":"7805","status":"1","timestamp":"1472384634","alt":null,"title":null,"width":"198","height":"128","url":"https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_0.jpg"},"auctioneer_name":null,"mail_sale_date_from":null,"mail_sale_date_to":null,"live_sale_date_from":null,"live_sale_date_to":null,"buyers_premium":null,"lots_locked":false,"post_sale_discount":"20","sync_item_images":false,"last_item_images_sync":"1472384677","sale_sessions":null,"last_date_for_consignment":null,"sale_number":null,"additional_charges":null},{"id":3,"label":{"en":"Sale 1","he":"מכירה 1"},"published":"1","created":1472384634000,"updated":1472385312000,"author":{"id":null,"label":null,"self":"http://localhost/backoffice/www/drupal/api/v1.0/users/0","mail":null},"status":{"value":"ready_to_publish","label":"Ready to publish"},"description":{"en":null,"he":null},"subtitle":{"en":null,"he":null},"sale_type":"mail_and_live","bid_steps":[{"step":"1","step_from":"0"},{"step":"6","step_from":"21"},{"step":"15","step_from":"51"}],"logo":{"fid":"1","uid":"0","filename":"sale-logo.jpg","uri":"public://sale_covers/sale-logo.jpg","filemime":"image/jpeg","filesize":"7805","status":"1","timestamp":"1472384634","alt":null,"title":null,"width":"198","height":"128","url":"https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo.jpg"},"auctioneer_name":null,"mail_sale_date_from":null,"mail_sale_date_to":null,"live_sale_date_from":null,"live_sale_date_to":null,"buyers_premium":null,"lots_locked":false,"post_sale_discount":"20","sync_item_images":false,"last_item_images_sync":"1472384677","sale_sessions":null,"last_date_for_consignment":null,"sale_number":null,"additional_charges":null}]
  """
