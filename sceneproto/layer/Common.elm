module SceneProtos.$0.$1.Common exposing (Model, Env, nullModel)

{-| Common definitions

@docs Model, Env, nullModel

-}

import Lib.Env.Env as Env
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| Model

Add your own model data here.

-}
type alias Model =
    {}


{-| nullModel
-}
nullModel : Model
nullModel =
    {}


{-| Convenient type alias for the environment
-}
type alias Env =
    Env.Env CommonData
