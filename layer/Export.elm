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

import Lib.Layer.Base exposing (Layer)
import Scenes.$0.$1.Common exposing (Env, Model)
import Scenes.$0.$1.Model exposing (initModel, updateModel, updateModelRec, viewModel)
import Scenes.$0.LayerBase exposing (CommonData)
import Scenes.$0.SceneInit exposing ($0Init)


{-| Data
-}
type alias Data =
    Model


{-| initLayer
-}
initLayer : Env -> $0Init -> Layer Data CommonData
initLayer env i =
    { name = "$1"
    , data = initModel env i
    , update = updateModel
    , updaterec = updateModelRec
    , view = viewModel
    }

