module Scenes.$0.Components.ComponentBase exposing (ComponentMsg(..), ComponentTarget, BaseData)

{-|


# Component base

@docs ComponentMsg, ComponentTarget, BaseData

-}


{-| Component message
-}
type ComponentMsg
    = NullComponentMsg


{-| Component target
-}
type alias ComponentTarget =
    String


{-| Component base data
-}
type alias BaseData =
    ()
