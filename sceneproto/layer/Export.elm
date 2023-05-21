module SceneProtos.$0.$1.Export exposing
    ( Data
    , initLayer, initFromScene
    )

{-| Export module

@docs Data
@docs initLayer

-}

import Lib.Env.Env exposing (Env)
import Lib.Layer.Base exposing (Layer)
import SceneProtos.$0.$1.Common exposing (EnvC, Model)
import SceneProtos.$0.$1.Model exposing (initModel, updateModel, viewModel)
import SceneProtos.$0.LayerBase exposing (CommonData)
import SceneProtos.$0.LayerInit exposing ($0Init, LayerInitData(..))


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


{-| Initialize from the scene

Please change this to initialize your layer.

-}
initFromScene : Env -> $0Init -> LayerInitData
initFromScene _ _ =
    NullLayerInitData
