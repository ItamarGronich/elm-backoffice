module Decode.Status exposing (..)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeValue, succeed, string, int, (:=), andThen)


status : String -> Decoder SaleStatus
status status =
    succeed (constructStatus status)


type SaleStatus
    = SaleNew
    | SaleInProcess
    | SalePublishedOnSite
    | NullStatus


constructStatus : String -> SaleStatus
constructStatus status =
    case status of
        "New" ->
            SaleNew

        "In Process" ->
            SaleInProcess

        "Published On Site" ->
            SalePublishedOnSite

        _ ->
            NullStatus


deconstructStatus : SaleStatus -> String
deconstructStatus status =
    case status of
        SaleNew ->
            "New"

        SaleInProcess ->
            "In Process"

        SalePublishedOnSite ->
            "Published On Site"

        NullStatus ->
            ""
