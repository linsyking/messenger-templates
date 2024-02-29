module Lib.Component.Base exposing
    ( ComponentMsg, ComponentMsg_(..)
    , ComponentTarget(..)
    , ComponentInitData(..)
    , Component
    , ComponentTypes(..)
    , Data
    , nullData
    )

{-|


# Component

Component is designed to have the best flexibility and compability.

You can use component almost anywhere, in layers, in gamecomponents and components themselves.

You have to manually add components in your layer and update them manually.

It is **not** fast to communicate between many components.

Gamecomponents have better speed when communicating with each other. (their message types are built-in)

@docs ComponentMsg, ComponentMsg_
@docs ComponentTarget
@docs ComponentInitData
@docs Component
@docs ComponentTypes
@docs Data
@docs nullData

-}

import Canvas exposing (Renderable)
import Dict exposing (Dict)
import Lib.DefinedTypes.DefTypes exposing (DefinedTypes)
import Lib.Env.Env exposing (Env)
import Lib.Scene.Base exposing (MsgBase)
import Messenger.GeneralModel exposing (GeneralModel)



--- Component Base


{-| Component

The data entry doesn't have a fixed type, you can use any type you want.

Though this is flexible, it is not convenient to use sometimes.

If your object has many properties that are in common, you should create your own component type.

Examples are [GameComponent](https://github.com/linsyking/Reweave/blob/master/src/Lib/CoreEngine/GameComponent/Base.elm) which has a lot of game related properties.

-}
type alias Component =
    GeneralModel Data (Env ()) ComponentMsg ComponentTarget Renderable


{-| Data type used to initialize a component.
-}
type ComponentInitData
    = ComponentID Int ComponentInitData
    | ComponentMsg ComponentMsg
    | NullComponentInitData


{-| ComponentMsg

This is the message that can be sent to the layer

It can also be directly sent to messenger if using SOMMsg type, else should use OtherMsg type.

Add your own data in **ComponentMsg\_**

-}
type alias ComponentMsg =
    MsgBase ComponentMsg_


{-| ComponentMsg\_

this message is used when you want layer to deal with the component message.

Those entries are some basic data types we need.

You may add your own data types here.

However, if your data types are too complicated, you might want to create your own component type (like game component) to achieve better performance.

Only used in ComponentMsg type.

-}
type ComponentMsg_
    = ComponentStringMsg String
    | ComponentIntMsg Int
    | ComponentFloatMsg Float
    | ComponentBoolMsg Bool
    | ComponentStringDataMsg String ComponentMsg_
    | ComponentListMsg (List ComponentMsg_)
    | ComponentComponentMsg Component
    | ComponentComponentTargetMsg ComponentTarget
    | ComponentNamedMsg ComponentTarget ComponentMsg_
    | ComponentDTMsg DefinedTypes
    | NullComponentMsg


{-| ComponentTarget is the target you want to send the message to.

ComponentParentLayer is the layer that the component is in.

ComponentByName is the component that has the name you specified.

ComponentByID is the component that has the id you specified.

-}
type ComponentTarget
    = ComponentParentLayer
    | ComponentByName String
    | ComponentByID Int


{-| Defined Types for Component
-}
type ComponentTypes
    = CP Component


{-| Data

Data is the dictionary based on DefinedTypes.

This is the `Data` datatype for Component.

-}
type alias Data =
    { uid : Int
    , sublist : List ComponentTypes
    , extra : Dict String DefinedTypes
    }


{-| nullData
-}
nullData : Data
nullData =
    { uid = 0
    , sublist = []
    , extra = Dict.empty
    }
