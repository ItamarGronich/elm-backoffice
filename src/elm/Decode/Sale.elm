module Decode.Sale exposing (..)

import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, list, decodeString, succeed, string, int, (:=), andThen)


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


type alias Sale =
    { saleId : Int
    }


emptySale : Sale
emptySale =
    { saleId = 0
    }
