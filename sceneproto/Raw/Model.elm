module SceneProtos.$0.Model exposing (genScene)

{-| Scene configuration module

@docs genScene

-}

import Canvas
import Lib.Base exposing (SceneMsg)
import Lib.UserData exposing (UserData)
import Messenger.Scene.RawScene exposing (RawSceneProtoInit, RawSceneProtoLevelInit, RawSceneUpdate, RawSceneView, genRawScene, initCompose)
import Messenger.Scene.Scene exposing (MConcreteScene, SceneStorage)
import SceneProtos.$0.Init exposing (InitData)


type alias Data =
    {}


init : RawSceneProtoInit Data UserData InitData
init env msg =
    {}


update : RawSceneUpdate Data UserData SceneMsg
update env msg data =
    ( data, [], env )


view : RawSceneView UserData Data
view env data =
    Canvas.empty


scenecon : RawSceneProtoLevelInit UserData SceneMsg InitData -> MConcreteScene Data UserData SceneMsg
scenecon initd =
    { init = initCompose init initd
    , update = update
    , view = view
    }


{-| Scene generator
-}
genScene : RawSceneProtoLevelInit UserData SceneMsg InitData -> SceneStorage UserData SceneMsg
genScene initd =
    genRawScene <| scenecon initd
