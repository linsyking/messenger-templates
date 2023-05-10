module SceneProtos.$0.Common exposing (Model)

{-| This is the doc for this module

@docs Model

-}

import Lib.Scene.Base exposing (LayerPacker)
import SceneProtos.$0.LayerBase exposing (CommonData)
import SceneProtos.$0.LayerSettings exposing (LayerT)


{-| Model
-}
type alias Model =
    LayerPacker CommonData LayerT
