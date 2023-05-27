module Scenes.$0.$1.Export exposing
    ( Data
    , initLayer, initFromScene
    )

{-| Export module

The export module for layer. Only change initFromScene.

@docs Data
@docs initLayer, initFromScene

-}

import Lib.Env.Env exposing (Env)
import Lib.Layer.Base exposing (Layer)
import Scenes.$0.$1.Common exposing (EnvC, Model)
import Scenes.$0.$1.Model exposing (initModel, updateModel, viewModel)
import Scenes.$0.LayerBase exposing (CommonData)
import Scenes.$0.LayerInit exposing ($0Init, LayerInitData(..))


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


{-| Initialize layer from scene init data
-}
initFromScene : Env -> $0Init -> LayerInitData
initFromScene _ _ =
    NullLayerInitData

