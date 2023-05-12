module Scenes.$0.Common exposing (Model, nullModel)

{-| This is the doc for this module

@docs Model, nullModel

-}

import Lib.Scene.Base exposing (LayerPacker)
import Scenes.$0.LayerBase exposing (CommonData, nullCommonData)
import Scenes.$0.LayerSettings exposing (LayerT)


{-| Model
-}
type alias Model =
    LayerPacker CommonData LayerT


{-| nullModel
-}
nullModel : Model
nullModel =
    { commonData = nullCommonData
    , layers = []
    }
