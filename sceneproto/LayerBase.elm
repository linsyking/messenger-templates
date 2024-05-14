module SceneProtos.$0.LayerBase exposing
    ( LayerTarget
    , SceneCommonData
    , LayerMsg(..)
    )

{-|


# LayerBase

Basic data for the layers.

@docs LayerTarget
@docs SceneCommonData
@docs LayerMsg

-}


{-| Layer target type
-}
type alias LayerTarget =
    String


{-| Common data
-}
type alias SceneCommonData =
    {}


{-| General message for layers
-}
type LayerMsg
    = NullLayerMsg
