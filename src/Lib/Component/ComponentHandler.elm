module Lib.Component.ComponentHandler exposing
    ( update, updaterec, match, super, recBody
    , updateComponents
    , viewComponent
    )

{-| ComponentHandler deals with components

You can use these functions to handle components.

The mosy commonly used one is the `updateComponents` function, which will update all components recursively.

@docs update, updaterec, match, super, recBody
@docs updateComponents
@docs viewComponent

-}

import Canvas exposing (Renderable, group)
import Dict
import Lib.Component.Base exposing (Component, ComponentMsg(..), ComponentTarget(..), DefinedTypes(..))
import Lib.Env.Env exposing (Env, cleanEnv)
import Messenger.GeneralModel exposing (viewModelList)
import Messenger.Recursion exposing (RecBody)
import Messenger.RecursionList exposing (updateObjects)



-- Below are using the Recursion algorithm to get the update function


{-| RecUpdater
-}
updaterec : Component -> Env -> ComponentMsg -> ( Component, List ( ComponentTarget, ComponentMsg ), Env )
updaterec c env ct =
    let
        ( newx, newmsg, newenv ) =
            c.updaterec env ct c.data
    in
    ( { c | data = newx }, newmsg, newenv )


{-| Updater
-}
update : Component -> Env -> ( Component, List ( ComponentTarget, ComponentMsg ), Env )
update c env =
    let
        ( newx, newmsg, newenv ) =
            c.update env c.data
    in
    ( { c | data = newx }, newmsg, newenv )


{-| Matcher
-}
match : Component -> ComponentTarget -> Bool
match c ct =
    case ct of
        ComponentParentLayer ->
            False

        ComponentByID x ->
            Dict.get "id" c.data == Just (CDInt x)

        ComponentByName x ->
            c.name == x


{-| Super
-}
super : ComponentTarget -> Bool
super ct =
    case ct of
        ComponentParentLayer ->
            True

        _ ->
            False


{-| Rec body for the component
-}
recBody : RecBody Component ComponentMsg Env ComponentTarget
recBody =
    { update = update
    , updaterec = updaterec
    , match = match
    , super = super
    , clean = cleanEnv
    }


{-| Update all the components in a list and recursively update the components which have messenges sent.

Return a list of messages sent to the parentlayer.

-}
updateComponents : Env -> List Component -> ( List Component, List ComponentMsg, Env )
updateComponents env =
    updateObjects recBody env


{-| Generate the view of the components
-}
viewComponent : Env -> List Component -> Renderable
viewComponent env xs =
    group [] <| viewModelList env xs
