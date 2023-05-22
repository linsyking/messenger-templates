module Scenes.$0.$1.Model exposing
    ( initModel
    , updateModel
    , viewModel
    )

{-| Model module

@docs initModel
@docs updateModel
@docs viewModel

-}

import Canvas exposing (Renderable)
import Lib.Component.Base exposing (ComponentMsg(..))
import Lib.Component.ComponentHandler exposing (updateComponents, viewComponent)
import Lib.Env.Env exposing (addCommonData, noCommonData)
import Lib.Layer.Base exposing (LayerMsg(..), LayerTarget(..))
import Scenes.$0.$1.Common exposing (EnvC, Model)
import Scenes.$0.LayerInit exposing (LayerInitData)


{-| initModel
Add components here
-}
initModel : EnvC -> LayerInitData -> Model
initModel _ _ =
    { components = []
    }


{-| Handle component messages (that are sent to this layer).
-}
handleComponentMsg : EnvC -> ComponentMsg -> Model -> ( Model, List ( LayerTarget, LayerMsg ), EnvC )
handleComponentMsg env _ model =
    ( model, [], env )


{-| updateModel
Default update function

Add your logic to handle msg and LayerMsg here

-}
updateModel : EnvC -> LayerMsg -> Model -> ( Model, List ( LayerTarget, LayerMsg ), EnvC )
updateModel env _ model =
    let
        components =
            model.components

        ( newComponents, newMsg, newEnv ) =
            updateComponents (noCommonData env) components
    in
    List.foldl
        (\cTMsg ( m, cmsg, cenv ) ->
            let
                ( nm, nmsg, nenv ) =
                    handleComponentMsg cenv cTMsg m
            in
            ( nm, nmsg ++ cmsg, nenv )
        )
        ( { model | components = newComponents }, [], addCommonData env.commonData newEnv )
        newMsg


{-| viewModel
Default view function

If you don't have components, remove viewComponent.

If you have other elements than components, add them after viewComponent.

-}
viewModel : EnvC -> Model -> Renderable
viewModel env model =
    viewComponent (noCommonData env) model.components
