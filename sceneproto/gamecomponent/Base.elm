module SceneProtos.$0.GameComponent.Base exposing
    ( Data
    , GameComponent
    , GameComponentInitData(..)
    , GameComponentMsg(..)
    , GameComponentTarget(..)
    )

import Canvas exposing (Renderable)
import Dict exposing (Dict)
import Lib.Component.Base exposing (DefinedTypes)
import Lib.Env.Env exposing (EnvC)
import Messenger.GeneralModel exposing (GeneralModel)
import SceneProtos.$0.LayerBase exposing (CommonData)


type alias GameComponent =
    GeneralModel Data (EnvC CommonData) GameComponentMsg GameComponentTarget Renderable


type GameComponentTarget
    = GCParent
    | GCById Int
    | GCByName String


type GameComponentMsg
    = NullGCMsg


type alias Data =
    { uid : Int
    , alive : Bool
    , extra : Dict String DefinedTypes
    }


type GameComponentInitData
    = GCIdData Int GameComponentInitData
    | NullGCInitData
