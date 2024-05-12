module Scenes.$0.$1.Model exposing
    ( Data
    , init
    , update, updaterec
    , view
    , matcher
    , layer
    )

{-| Layer configuration module

Set the Data Type, Init logic, Update logic, View logic and Matcher logic here.

@docs Data
@docs init
@docs update, updaterec
@docs view
@docs matcher
@docs layer

-}

import Canvas
import Lib.Base exposing (SceneMsg)
import Lib.UserData exposing (UserData)
import Messenger.Audio.Base exposing (AudioOption(..))
import Messenger.Base exposing (WorldEvent(..))
import Messenger.GeneralModel exposing (Matcher, Msg(..), MsgBase(..))
import Messenger.Layer.Layer exposing (ConcreteLayer, LayerInit, LayerStorage, LayerUpdate, LayerUpdateRec, LayerView, genLayer)
import Scenes.$0.LayerBase exposing (..)


{-| Data type for layer
-}
type alias Data =
    {}


{-| Init function for layer
-}
init : LayerInit SceneCommonData UserData LayerMsg Data
init env initMsg =
    {}


{-| Update function for layer
-}
update : LayerUpdate SceneCommonData UserData LayerTarget LayerMsg SceneMsg Data
update env evt data =
    ( data, [], ( env, False ) )


{-| Recursively update function
-}
updaterec : LayerUpdateRec SceneCommonData UserData LayerTarget LayerMsg SceneMsg Data
updaterec env msg data =
    ( data, [], env )


{-| view

view function for layer **Layer** in **Test\_SOMMsg**

-}
view : LayerView SceneCommonData UserData Data
view env data =
    Canvas.empty


{-| Matcher function
-}
matcher : Matcher Data LayerTarget
matcher data tar =
    tar == "$1"


{-| Concrete layer
-}
layercon : ConcreteLayer Data SceneCommonData UserData LayerTarget LayerMsg SceneMsg
layercon =
    { init = init
    , update = update
    , updaterec = updaterec
    , view = view
    , matcher = matcher
    }


{-| Generator function to generate an abstract layer storage
-}
layer : LayerStorage SceneCommonData UserData LayerTarget LayerMsg SceneMsg
layer =
    genLayer layercon
