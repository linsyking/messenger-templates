module SceneProtos.$0.$1.Export exposing
    ( Data
    , initLayer
    )

{-| Export module

@docs Data
@docs initLayer

-}

import Lib.Layer.Base exposing (Layer)
import SceneProtos.$0.$1.Common exposing (EnvC, Model)
import SceneProtos.$0.$1.Model exposing (initModel, updateModel, updateModelRec, viewModel)
import SceneProtos.$0.LayerBase exposing (CommonData)
import SceneProtos.$0.SceneInit exposing ($0Init)


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
    , updaterec = updateModelRec
    , view = viewModel
    }

