module Scenes.$0.$1.Global exposing (getLayerT)

{-| This is the doc for this module

@docs getLayerT

-}

import Canvas exposing (Renderable)
import Lib.Layer.Base exposing (Layer, LayerMsg, LayerTarget)
import Messenger.GeneralModel exposing (GeneralModel)
import Scenes.$0.$1.Common exposing (EnvC)
import Scenes.$0.$1.Export exposing (Data, nullData)
import Scenes.$0.LayerBase exposing (CommonData)
import Scenes.$0.LayerSettings exposing (LayerDataType(..), LayerT)


dataToLDT : Data -> LayerDataType
dataToLDT data =
    $1Data data


ldtToData : LayerDataType -> Data
ldtToData ldt =
    case ldt of
        $1Data x ->
            x

        _ ->
            nullData


{-| getLayerT
-}
getLayerT : Layer Data CommonData -> LayerT
getLayerT layer =
    let
        update : EnvC -> LayerMsg -> LayerDataType -> ( LayerDataType, List ( LayerTarget, LayerMsg ), EnvC )
        update env lm ldt =
            let
                ( rldt, newmsg, newenv ) =
                    layer.update env lm (ldtToData ldt)
            in
            ( dataToLDT rldt, newmsg, newenv )

        view : EnvC -> LayerDataType -> Renderable
        view env ldt =
            layer.view env (ldtToData ldt)
    in
    GeneralModel layer.name (dataToLDT layer.data) update view
