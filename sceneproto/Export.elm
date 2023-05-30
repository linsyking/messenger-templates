module Scenes.$0.Export exposing (game)

{-| Export module

@docs game

-}

import Lib.Env.Env exposing (Env)
import Lib.Scene.Base exposing (SceneTMsg)
import SceneProtos.$1.SceneInit exposing ($1Init)


{-| Use the environment and sent init data to change the init data.
-}
game : Env -> SceneTMsg -> $1Init
game _ _ =
    {}
