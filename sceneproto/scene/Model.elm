module SceneProtos.$0.Model exposing
    ( handleLayerMsg
    , updateModel
    , viewModel
    )

{-| SceneProto update module

@docs handleLayerMsg
@docs updateModel
@docs viewModel

-}

import Canvas exposing (Renderable)
import Lib.Audio.Base exposing (AudioOption(..))
import Lib.Env.Env exposing (Env, addCommonData, noCommonData)
import Lib.Layer.Base exposing (LayerMsg(..))
import Lib.Layer.LayerHandler exposing (updateLayer, viewLayer)
import Lib.Scene.Base exposing (SceneOutputMsg(..))
import SceneProtos.$0.Common exposing (Model)
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| handleLayerMsg

Usually you add logic here.

-}
handleLayerMsg : Env CommonData -> LayerMsg -> Model -> ( Model, List SceneOutputMsg, Env CommonData )
handleLayerMsg env lmsg model =
    case lmsg of
        LayerSoundMsg name path opt ->
            ( model, [ SOMPlayAudio name path opt ], env )

        LayerStopSoundMsg name ->
            ( model, [ SOMStopAudio name ], env )

        _ ->
            ( model, [], env )


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
