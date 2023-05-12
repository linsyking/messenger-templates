module Scenes.$0.Export exposing (game)

import Lib.Env.Env exposing (Env)
import Lib.Scene.Base exposing (SceneTMsg)


{-| Use the environment and sent init data to change the init data.
-}
game : Env -> SceneTMsg -> $1Init
game _ _ =
    {}
