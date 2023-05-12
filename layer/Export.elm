module Scenes.$0.$1.Export exposing
    ( Data
    , initLayer
    )

{-| This is the doc for this module

@docs Data
@docs initLayer

-}

import Lib.Layer.Base exposing (Layer)
import Scenes.$0.$1.Common exposing (EnvC, Model)
import Scenes.$0.$1.Model exposing (initModel, updateModel, viewModel)
import Scenes.$0.LayerBase exposing (CommonData, LayerInitData)


{-| Data
-}
type alias Data =
    Model


{-| initLayer
-}
initLayer : EnvC -> LayerInitData -> Layer Data CommonData
initLayer env i =
    { name = "$1"
    , data = initModel env i
    , update = updateModel
    , view = viewModel
    }
