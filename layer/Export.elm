module Scenes.$0.$1.Export exposing
    ( Data
    , nullData
    , layer
    )

{-| This is the doc for this module

@docs Data
@docs nullData
@docs layer

-}

import Array
import Lib.Layer.Base exposing (Layer)
import Scenes.$0.$1.Common exposing (Model)
import Scenes.$0.$1.Model exposing (initModel, updateModel, viewModel)
import Scenes.$0.LayerBase exposing (CommonData, LayerInitData)


{-| Data
-}
type alias Data =
    Model


{-| nullData
-}
nullData : Data
nullData =
    { components = Array.empty
    }


{-| layer
-}
layer : Layer Data CommonData LayerInitData
layer =
    { name = "$1"
    , data = nullData
    , init = initModel
    , update = updateModel
    , view = viewModel
    }
