module Scenes.$0.$1.Common exposing
    ( Model, nullModel, Env
    , updateComponentsByHandler
    )

{-| Common module

@docs Model, nullModel, Env
@docs updateComponentsByHandler

-}

import Lib.Component.Base exposing (Component, ComponentMsg)
import Lib.Component.ComponentHandler exposing (updateComponents)
import Lib.Env.Env as Env
import Lib.Layer.Base exposing (LayerMsg, LayerTarget)
import Scenes.$0.LayerBase exposing (CommonData)


{-| Model
Add your own data here.
-}
type alias Model =
    { components : List Component
    }


{-| nullModel
-}
nullModel : Model
nullModel =
    { components = []
    }


{-| Convenient type alias for the environment
-}
type alias Env =
    Env.Env CommonData


{-| Update model components by handler

Don't modify this function

-}
updateComponentsByHandler : Env -> Model -> (Env -> ComponentMsg -> Model -> ( Model, List ( LayerTarget, LayerMsg ), Env )) -> ( Model, List ( LayerTarget, LayerMsg ), Env )
updateComponentsByHandler env model handle =
    let
        ( newComponents, newMsg, newEnv ) =
            updateComponents (Env.noCommonData env) model.components
    in
    List.foldl
        (\cTMsg ( m, cmsg, cenv ) ->
            let
                ( nm, nmsg, nenv ) =
                    handle cenv cTMsg m
            in
            ( nm, nmsg ++ cmsg, nenv )
        )
        ( { model | components = newComponents }, [], Env.addCommonData env.commonData newEnv )
        newMsg
