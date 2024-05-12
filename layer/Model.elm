module Scenes.$0.$1.Model exposing (layer)

{-| Layer configuration module

Set the Data Type, Init logic, Update logic, View logic and Matcher logic here.

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


type alias Data =
    {}


init : LayerInit SceneCommonData UserData LayerMsg Data
init env initMsg =
    {}


update : LayerUpdate SceneCommonData UserData LayerTarget LayerMsg SceneMsg Data
update env evt data =
    ( data, [], ( env, False ) )


updaterec : LayerUpdateRec SceneCommonData UserData LayerTarget LayerMsg SceneMsg Data
updaterec env msg data =
    ( data, [], env )


view : LayerView SceneCommonData UserData Data
view env data =
    Canvas.empty


matcher : Matcher Data LayerTarget
matcher data tar =
    tar == "$1"


layercon : ConcreteLayer Data SceneCommonData UserData LayerTarget LayerMsg SceneMsg
layercon =
    { init = init
    , update = update
    , updaterec = updaterec
    , view = view
    , matcher = matcher
    }


layer : LayerStorage SceneCommonData UserData LayerTarget LayerMsg SceneMsg
layer =
    genLayer layercon
