module SceneProtos.$0.SceneInit exposing ($0Init, null$0Init, initCommonData)

{-| SceneInit

@docs null$0Init
@docs $0Init
@docs initCommonData

-}

import Lib.Env.Env exposing (Env)
import SceneProtos.$0.LayerBase exposing (CommonData, nullCommonData)


{-| Init Data
-}
type alias $0Init =
    {}


{-| Null $0 init
-}
null$0Init : $0Init
null$0Init =
    {}


{-| Initialize common data
-}
initCommonData : Env () -> $0Init -> CommonData
initCommonData _ _ =
    nullCommonData
