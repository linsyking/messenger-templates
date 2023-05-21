module SceneProtos.$0.GameComponents.$1.Export exposing (initGC)

import Lib.Env.Env exposing (Env)
import SceneProtos.$0.GameComponent.Base exposing (GameComponent, GameComponentInitData)
import SceneProtos.$0.GameComponents.$1.Model exposing (initModel, updateModel, viewModel)


initGC : Env -> GameComponentInitData -> GameComponent
initGC env i =
    { name = "$1"
    , data = initModel env i
    , update = updateModel
    , view = viewModel
    }
