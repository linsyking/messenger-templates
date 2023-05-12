module Scenes.$0.Export exposing (game)

import Lib.Env.Env exposing (Env)
import Lib.Scene.Base exposing (SceneTMsg)
import SceneProtos.$1.LayerInit exposing ($1Init)


{-| Use the environment and sent init data to change the init data.
-}
game : Env -> SceneTMsg -> $1Init
game _ _ =
    {}
