module SceneProtos.$0.GameComponent.Base exposing
    ( GameComponent, GameComponentTarget(..)
    , GameComponentMsg(..)
    , GameComponentTypes(..)
    , Data, nullData
    )

{-|


# GameComponent

This is generated by Mesenger.

@docs GameComponent, GameComponentTarget
@docs GameComponentMsg
@docs GameComponentTypes
@docs Data, nullData
@docs GameComponentInitData

-}

import Canvas exposing (Renderable)
import Dict exposing (Dict)
import Lib.DefinedTypes.DefTypes exposing (DefinedTypes(..))
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

{-| Defined Types for GameComponent
-}
type GameComponentTypes
    = GC GameComponent


{-| Add your data here!
-}
type alias Data =
    { uid : Int
    , alive : Bool
    , sublist : List GameComponentTypes
    , extra : Dict String GameComponentTypes
    }


{-| nullData
-}
nullData : Data
nullData =
    { uid = 0
    , alive = True
    , sublist = []
    , extra = Dict.empty
    }


{-| GC init data, don't modify this by hand!
-}
type GameComponentInitData
    = GCIdData Int GameComponentInitData
    | NullGCInitData
