module Decode.Sale exposing (..)

import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, list, decodeString, succeed, string, int, (:=), andThen)
import Decode.Status exposing (..)


sales : String -> List Sale
sales payload =
    case decodeString (list saleDecoder) payload of
        Ok sale ->
            sale

        Err message ->
            [ emptySale ]


saleDecoder : Decoder Sale
saleDecoder =
    succeed Sale
        |: ("id" := int)
        |: ("status" := decodeStatus)


type alias Sale =
    { saleId : Int
    , status : SaleStatus
    }


emptySale : Sale
emptySale =
    { saleId = 0
    , status = convertToStatus ""
    }
