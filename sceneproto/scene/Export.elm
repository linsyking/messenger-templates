module SceneProtos.$0.Export exposing
    ( Data
    , nullData
    , genScene
    )

{-| This is the doc for this module

@docs Data
@docs nullData
@docs genScene

-}

import Lib.Env.Env exposing (Env)
import Lib.Scene.Base exposing (Scene, SceneInitData(..), SceneTMsg(..))
import SceneProtos.$0.Common exposing (Model)
import SceneProtos.$0.LayerBase exposing (nullCommonData)
import SceneProtos.$0.LayerInit exposing ($0Init)
import SceneProtos.$0.Model exposing (initModel, updateModel, viewModel)


{-| Data
-}
type alias Data =
    Model


{-| nullData
-}
nullData : Data
nullData =
    { commonData = nullCommonData
    , layers = []
    }


{-| genScene
-}
genScene : (Env -> SceneTMsg -> $0Init) -> Scene Data
genScene im =
    { init =
        \env i ->
            case i of
                SceneTransMsg init ->
                    initModel env <| $0InitData (im env init)

                _ ->
                    initModel env <| $0InitData (im env NullSceneMsg)
    , update = updateModel
    , view = viewModel
    }
