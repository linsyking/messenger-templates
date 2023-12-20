module SceneProtos.$0.GameComponent.Handler exposing
    ( update, updaterec, match, super, recBody
    , updateGC, viewGC
    )

{-| Handler to update game components

@docs update, updaterec, match, super, recBody
@docs updateGC, viewGC

-}

import Canvas exposing (Renderable, group)
import Lib.Env.Env exposing (Env, cleanEnv, patchEnv)
import Messenger.GeneralModel exposing (viewModelList)
import Messenger.Recursion exposing (RecBody)
import Messenger.RecursionList exposing (updateObjects)
import SceneProtos.$0.GameComponent.Base exposing (GameComponent, GameComponentMsg(..), GameComponentTarget(..))
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| RecUpdater
-}
updaterec : GameComponent -> Env CommonData -> GameComponentMsg -> ( GameComponent, List ( GameComponentTarget, GameComponentMsg ), Env CommonData )
updaterec gc env msg =
    let
        ( newGC, newMsg, newEnv ) =
            gc.updaterec env msg gc.data
    in
    ( { gc | data = newGC }, newMsg, newEnv )


{-| Updater
-}
update : GameComponent -> Env CommonData -> ( GameComponent, List ( GameComponentTarget, GameComponentMsg ), Env CommonData )
update gc env =
    let
        ( newGC, newMsg, newEnv ) =
            gc.update env gc.data
    in
    ( { gc | data = newGC }, newMsg, newEnv )


{-| Matcher
-}
match : GameComponent -> GameComponentTarget -> Bool
match gc tar =
    case tar of
        GCParent ->
            False

        GCById x ->
            x == gc.data.uid

        GCByName x ->
            x == gc.name


{-| Super
-}
super : GameComponentTarget -> Bool
super tar =
    case tar of
        GCParent ->
            True

        _ ->
            False


{-| Rec body for the component
-}
recBody : RecBody GameComponent GameComponentMsg (Env CommonData) GameComponentTarget
recBody =
    { update = update
    , updaterec = updaterec
    , match = match
    , super = super
    , clean = cleanEnv
    , patch = patchEnv
    }


{-| Update all the components in an array and recursively update the components which have messenges sent.

Return a list of messages sent to the parentlayer.

-}
updateGC : Env CommonData -> List GameComponent -> ( List GameComponent, List GameComponentMsg, Env CommonData )
updateGC env xs =
    let
        ( newGC, newMsg, newEnv ) =
            updateObjects recBody env xs
    in
    ( newGC, newMsg, newEnv )


{-| Generate the view of the components
-}
viewGC : Env CommonData -> List GameComponent -> Renderable
viewGC env xs =
    group [] <|
        List.map (\( a, _ ) -> a) <|
            List.sortBy (\( _, a ) -> a) <|
                List.concat <|
                    viewModelList env xs
