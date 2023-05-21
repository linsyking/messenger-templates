module SceneProtos.$0.Export exposing
    ( Data
    , genScene
    )

{-| Export module

Normally you don't need to change this file.

@docs Data
@docs genScene

-}

import Lib.Env.Env exposing (Env)
import Lib.Scene.Base exposing (Scene, SceneInitData(..), SceneTMsg(..))
import SceneProtos.$0.Common exposing (Model)
import SceneProtos.$0.LayerInit exposing ($0Init)
import SceneProtos.$0.Model exposing (initModel, updateModel, viewModel)


{-| Data
-}
type alias Data =
    Model


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
