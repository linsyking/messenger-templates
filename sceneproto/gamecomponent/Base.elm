module SceneProtos.$0.GameComponent.Base exposing
    ( Data, nullData
    , GameComponent
    , GameComponentInitData(..)
    , GameComponentMsg(..)
    , GameComponentTarget(..)
    )

{-|


# GameComponent

This is generated by Mesenger.

@docs GameComponent, GameComponentTarget
@docs GameComponentMsg
@docs Data, nullData
@docs GameComponentInitData

-}

import Canvas exposing (Renderable)
import Dict exposing (Dict)
import Lib.Component.Base exposing (DefinedTypes)
import Lib.Env.Env exposing (Env)
import Messenger.GeneralModel exposing (GeneralModel)
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| GameComponent Definition
-}
type alias GameComponent =
    GeneralModel Data (Env CommonData) GameComponentMsg GameComponentTarget (List ( Renderable, Int ))


{-| GameComponent Target
-}
type GameComponentTarget
    = GCParent
    | GCById Int
    | GCByName String


{-| Messages for GameComponent
-}
type GameComponentMsg
    = NullGCMsg


{-| Add your data here!
-}
type alias Data =
    { uid : Int
    , alive : Bool
    , extra : Dict String DefinedTypes
    }


{-| nullData
-}
nullData : Data
nullData =
    { uid = 0
    , alive = True
    , extra = Dict.empty
    }


{-| GC init data, don't modify this by hand!
-}
type GameComponentInitData
    = GCIdData Int GameComponentInitData
    | NullGCInitData
