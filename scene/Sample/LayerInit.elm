module Scenes.$0.LayerInit exposing
    ( null$0Init
    , $0Init
    , initCommonData
    )

{-| LayerInit

@docs null$0Init
@docs $0Init
@docs initCommonData

-}

import Lib.Env.Env exposing (Env)
import Scenes.$0.LayerBase exposing (CommonData, nullCommonData)


{-| Init Data
-}
type alias $0Init =
    {}


{-| Null $0Init data
-}
null$0Init : $0Init
null$0Init =
    {}


{-| Initialize common data
-}
initCommonData : Env -> $0Init -> CommonData
initCommonData _ _ =
    nullCommonData

