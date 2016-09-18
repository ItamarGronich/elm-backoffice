module Decode.Status exposing (..)

import Json.Decode exposing (Decoder, succeed, (:=), andThen, string)
import Json.Decode.Extra exposing ((|:))


type SaleStatus
    = Mail
    | New
    | ReadyToPublish
    | UnkownStatus


decodeStatus : Decoder Status
decodeStatus =
    succeed Status
        |: (("value" := string) `andThen` decodeStatusType)


decodeStatusType : String -> Decoder SaleStatus
decodeStatusType status =
    succeed (convertToStatus status)


convertToStatus : String -> SaleStatus
convertToStatus status =
    case status of
        "new" ->
            New

        "ready_to_publish" ->
            ReadyToPublish

        _ ->
            UnkownStatus


type alias Status =
    { value : SaleStatus
    }
