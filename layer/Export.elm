module Scenes.$0.$1.Export exposing
    ( Data
    , initLayer
    )

{-| Export module

The export module for layer.

Although this will not be updated, usually you don't need to change this file.

@docs Data
@docs initLayer

-}

import Lib.Env.Env exposing (Env)
import Lib.Layer.Base exposing (Layer)
import Scenes.$0.$1.Common exposing (EnvC, Model)
import Scenes.$0.$1.Model exposing (initModel, updateModel, viewModel)
import Scenes.$0.LayerBase exposing (CommonData)
import Scenes.$0.LayerInit exposing ($0Init)


{-| Data
-}
type alias Data =
    Model


{-| initLayer
-}
initLayer : EnvC -> $0Init -> Layer Data CommonData
initLayer env i =
    { name = "$1"
    , data = initModel env i
    , update = updateModel
    , view = viewModel
    }

