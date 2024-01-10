module Lib.Layer.LayerHandler exposing
    ( update, updaterec, match, super, recBody
    , updateLayer
    , viewLayer
    )

{-|


# Layer Handler

@docs update, updaterec, match, super, recBody
@docs updateLayer
@docs viewLayer

-}

import Canvas exposing (Renderable, group)
import Lib.Env.Env exposing (Env, cleanEnv, patchEnv)
import Lib.Layer.Base exposing (Layer, LayerMsg, LayerTarget(..))
import Messenger.GeneralModel exposing (viewModelList)
import Messenger.Recursion exposing (RecBody)
import Messenger.RecursionList exposing (updateObjects)


{-| Updater
-}
update : Layer a b -> Env b -> ( Layer a b, List ( LayerTarget, LayerMsg ), Env b )
update layer env =
    let
        ( newData, newMsgs, newEnv ) =
            layer.update env layer.data
    in
    ( { layer | data = newData }, newMsgs, newEnv )


{-| RecUpdater
-}
updaterec : Layer a b -> Env b -> LayerMsg -> ( Layer a b, List ( LayerTarget, LayerMsg ), Env b )
updaterec layer env lm =
    let
        ( newData, newMsgs, newEnv ) =
            layer.updaterec env lm layer.data
    in
    ( { layer | data = newData }, newMsgs, newEnv )


{-| Matcher
-}
match : Layer a b -> LayerTarget -> Bool
match l t =
    case t of
        LayerParentScene ->
            False

        LayerName n ->
            n == l.name


{-| Super
-}
super : LayerTarget -> Bool
super t =
    case t of
        LayerParentScene ->
            True

        LayerName _ ->
            False


{-| Recbody
-}
recBody : RecBody (Layer a b) LayerMsg (Env b) LayerTarget
recBody =
    { update = update, updaterec = updaterec, match = match, super = super, clean = cleanEnv, patch = patchEnv }


{-| updateLayer

Update all the layers.

-}
updateLayer : Env b -> List (Layer a b) -> ( List (Layer a b), List LayerMsg, Env b )
updateLayer env =
    updateObjects recBody env


{-| viewLayer

Get the view of the layer.

-}
viewLayer : Env b -> List (Layer a b) -> Renderable
viewLayer env models =
    group [] <| viewModelList env models
