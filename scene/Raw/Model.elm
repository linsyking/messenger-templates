module Scenes.$0.Model exposing (scene)

{-| Scene configuration module

@docs scene

-}

import Canvas
import Lib.Base exposing (SceneMsg)
import Lib.UserData exposing (UserData)
import Messenger.Scene.RawScene exposing (RawSceneInit, RawSceneUpdate, RawSceneView, genRawScene)
import Messenger.Scene.Scene exposing (MConcreteScene, SceneStorage)


{-| Scene data
-}
type alias Data =
    {}


{-| Init function for the scene.

Add all the layers with their init msg here.

-}
init : RawSceneInit Data UserData SceneMsg
init env msg =
    {}


update : RawSceneUpdate Data UserData SceneMsg
update env msg data =
    ( data, [], env )


view : RawSceneView UserData Data
view env data =
    Canvas.empty


scenecon : MConcreteScene Data UserData SceneMsg
scenecon =
    { init = init
    , update = update
    , view = view
    }


{-| Generate an abstract scnene storage
-}
scene : SceneStorage UserData SceneMsg
scene =
    genRawScene scenecon
