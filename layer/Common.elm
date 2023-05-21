module Scenes.$0.$1.Common exposing (Model, nullModel, EnvC)

{-| Common module

@docs Model, nullModel, EnvC

-}

import Lib.Component.Base exposing (Component)
import Lib.Env.Env as Env
import Scenes.$0.LayerBase exposing (CommonData)


{-| Model

Add your own data here.

-}
type alias Model =
    { components : List Component
    }


{-| nullModel
-}
nullModel : Model
nullModel =
    { components = []
    }


{-| Convenient type alias for the environment
-}
type alias EnvC =
    Env.EnvC CommonData
