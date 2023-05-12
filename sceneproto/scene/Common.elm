module SceneProtos.$0.Common exposing (Model, nullModel)

{-| This is the doc for this module

@docs Model, nullModel

-}

import Lib.Scene.Base exposing (LayerPacker)
import SceneProtos.$0.LayerBase exposing (CommonData, nullCommonData)
import SceneProtos.$0.LayerSettings exposing (LayerT)


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
