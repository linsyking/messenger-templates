module Scenes.$0.Export exposing
    ( Data
    , nullData
    , scene
    )

{-| This is the doc for this module

@docs Data
@docs nullData
@docs scene

-}

import Lib.Scene.Base exposing (Scene)
import Scenes.$0.Common exposing (Model)
import Scenes.$0.LayerBase exposing (nullCommonData)
import Scenes.$0.Model exposing (initModel, updateModel, viewModel)


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


{-| scene
-}
scene : Scene Data
scene =
    { init = initModel
    , update = updateModel
    , view = viewModel
    }
