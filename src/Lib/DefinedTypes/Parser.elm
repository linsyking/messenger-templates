module Lib.DefinedTypes.Parser exposing
    ( dIntGet, dIntSet
    , dFloatGet, dFloatSet
    , dBoolGet, dBoolSet
    , dStringGet, dStringSet
    , dListDTGet, dListDTSet
    , dDictDTGet, dDictDTSet
    , dColorGet, dColorSet
    )

{-| This is a parser for DefinedTypes.

You have to use functions here to decode and encode DefinedTypes.

@docs dIntGet, dIntSet
@docs dFloatGet, dFloatSet
@docs dBoolGet, dBoolSet
@docs dStringGet, dStringSet
@docs dListDTGet, dListDTSet
@docs dDictDTGet, dDictDTSet
@docs dColorGet, dColorSet

-}

import Color exposing (Color)
import Dict exposing (Dict)
import Lib.DefinedTypes.DefTypes exposing (DefinedTypes(..))
import Lib.Scene.Base exposing (MsgBase(..))


{-| dIntGet
-}
dIntGet : Dict String DefinedTypes -> String -> Int
dIntGet f s =
    let
        other =
            0
    in
    case Dict.get s f of
        Just (DTInt x) ->
            x

        _ ->
            other


{-| dIntSet
-}
dIntSet : String -> Int -> Dict String DefinedTypes -> Dict String DefinedTypes
dIntSet s t f =
    Dict.update s (\_ -> Just (DTInt t)) f


{-| dFloatGet
-}
dFloatGet : Dict String DefinedTypes -> String -> Float
dFloatGet f s =
    let
        other =
            0
    in
    case Dict.get s f of
        Just (DTFloat x) ->
            x

        _ ->
            other


{-| dFloatSet
-}
dFloatSet : String -> Float -> Dict String DefinedTypes -> Dict String DefinedTypes
dFloatSet s t f =
    Dict.update s (\_ -> Just (DTFloat t)) f


{-| dBoolGet
-}
dBoolGet : Dict String DefinedTypes -> String -> Bool
dBoolGet f s =
    let
        other =
            False
    in
    case Dict.get s f of
        Just (DTBool x) ->
            x

        _ ->
            other


{-| dBoolSet
-}
dBoolSet : String -> Bool -> Dict String DefinedTypes -> Dict String DefinedTypes
dBoolSet s t f =
    Dict.update s (\_ -> Just (DTBool t)) f


{-| dStringGet
-}
dStringGet : Dict String DefinedTypes -> String -> String
dStringGet f s =
    let
        other =
            ""
    in
    case Dict.get s f of
        Just (DTString x) ->
            x

        _ ->
            other


{-| dStringSet
-}
dStringSet : String -> String -> Dict String DefinedTypes -> Dict String DefinedTypes
dStringSet s t f =
    Dict.update s (\_ -> Just (DTString t)) f


{-| dListDTGet
-}
dListDTGet : Dict String DefinedTypes -> String -> List DefinedTypes
dListDTGet f s =
    let
        other =
            []
    in
    case Dict.get s f of
        Just (DTListDT x) ->
            x

        _ ->
            other


{-| dListDTSet
-}
dListDTSet : String -> List DefinedTypes -> Dict String DefinedTypes -> Dict String DefinedTypes
dListDTSet s t f =
    Dict.update s (\_ -> Just (DTListDT t)) f


{-| dDictDTGet
-}
dDictDTGet : Dict String DefinedTypes -> String -> Dict String DefinedTypes
dDictDTGet f s =
    case Dict.get s f of
        Just (DTDictDT x) ->
            x

        _ ->
            Dict.empty


{-| dDictDTSet
-}
dDictDTSet : String -> Dict String DefinedTypes -> Dict String DefinedTypes -> Dict String DefinedTypes
dDictDTSet s t f =
    Dict.update s (\_ -> Just (DTDictDT t)) f


{-| dColorGet
-}
dColorGet : Dict String DefinedTypes -> String -> Color
dColorGet f s =
    case Dict.get s f of
        Just (DTColor x) ->
            x

        _ ->
            Color.black


{-| dColorSet
-}
dColorSet : String -> Color -> Dict String DefinedTypes -> Dict String DefinedTypes
dColorSet s t f =
    Dict.update s (\_ -> Just (DTColor t)) f
