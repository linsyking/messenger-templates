module Scenes.$0.Model exposing (scene)

{-|


# Level configuration module

-}

import Lib.Base exposing (SceneMsg)
import Lib.UserData exposing (UserData)
import Messenger.Scene.RawScene exposing (RawSceneProtoLevelInit)
import Messenger.Scene.Scene exposing (SceneStorage)
import SceneProtos.$1.Init exposing (InitData)
import SceneProtos.$1.Model exposing (genScene)


init : RawSceneProtoLevelInit UserData SceneMsg InitData
init env msg =
    Nothing


{-| Scene storage
-}
scene : SceneStorage UserData SceneMsg
scene =
    genScene init
