module Scenes.$0.Model exposing
    ( handleLayerMsg
    , updateModel
    , viewModel
    )

{-| Scene update module

@docs handleLayerMsg
@docs updateModel
@docs viewModel

-}

import Canvas exposing (Renderable)
import Lib.Audio.Base exposing (AudioOption(..))
import Lib.Env.Env exposing (Env, addCommonData, noCommonData)
import Lib.Layer.Base exposing (LayerMsg, LayerMsg_(..))
import Lib.Layer.LayerHandler exposing (updateLayer, viewLayer)
import Lib.Scene.Base exposing (MsgBase(..), SceneInitData(..), SceneOutputMsg(..))
import Scenes.$0.Common exposing (Model)
import Scenes.$0.LayerBase exposing (CommonData)


{-| handleLayerMsg

Handle Layer Messages

Note that the layer messages with SOMMsg type(directly copy from the component message) will be directly sent to messenger

-}
handleLayerMsg : Env CommonData -> LayerMsg -> Model -> ( Model, List SceneOutputMsg, Env CommonData )
handleLayerMsg env msgb model =
    case msgb of
        OtherMsg lmsg ->
            case lmsg of
                LayerSoundMsg name path opt ->
                    ( model, [ SOMPlayAudio name path opt ], env )

                LayerStopSoundMsg name ->
                    ( model, [ SOMStopAudio name ], env )

                LayerChangeSceneMsg name ->
                    ( model, [ SOMChangeScene ( NullSceneInitData, name, Nothing ) ], env )

                _ ->
                    ( model, [], env )

        SOMMsg sommsg ->
            ( model, [ sommsg ], env )


{-| updateModel

Default update function. Normally you won't change this function.

-}
updateModel : Env () -> Model -> ( Model, List SceneOutputMsg, Env () )
updateModel env model =
    let
        ( newdata, msgs, newenv ) =
            updateLayer (addCommonData model.commonData env) model.layers

        nmodel =
            { model | commonData = newenv.commonData, layers = newdata }

        ( newmodel, newsow, newgd2 ) =
            List.foldl
                (\x ( y, lmsg, cgd ) ->
                    let
                        ( model2, msg2, env2 ) =
                            handleLayerMsg cgd x y
                    in
                    ( model2, lmsg ++ msg2, env2 )
                )
                ( nmodel, [], newenv )
                msgs
    in
    ( newmodel, newsow, noCommonData newgd2 )


{-| Default view function
-}
viewModel : Env () -> Model -> Renderable
viewModel env model =
    viewLayer (addCommonData model.commonData env) model.layers
