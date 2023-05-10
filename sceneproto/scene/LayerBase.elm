module SceneProtos.$0.LayerBase exposing
    ( CommonData
    , LayerInitData(..), $0Init, nullCommonData
    )

{-| This is the doc for this module

@docs CommonData
@docs initCommonData
@docs LayerInitData
@docs $0Init

-}


{-| CommonData

Edit your own CommonData here!

-}
type alias CommonData =
    {}


{-| Null CommonData
-}
nullCommonData : CommonData
nullCommonData =
    {}

{-| Layer init data
-}
type LayerInitData
    = NullLayerInitData


{-| Scene init data
-}
type alias $0Init =
    {}
