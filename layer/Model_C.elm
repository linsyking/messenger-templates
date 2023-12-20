module Scenes.$0.$1.Model exposing
    ( initModel
    , updateModel, updateModelRec
    , viewModel
    )

{-| Model module

@docs initModel
@docs updateModel, updateModelRec
@docs viewModel

-}

import Canvas exposing (Renderable)
import Lib.Component.Base exposing (ComponentMsg(..))
import Lib.Component.ComponentHandler exposing (viewComponent)
import Lib.Env.Env exposing (noCommonData)
import Lib.Layer.Base exposing (LayerMsg(..), LayerTarget(..))
import Scenes.$0.$1.Common exposing (Env, Model, updateComponentsByHandler)
import Scenes.$0.SceneInit exposing ($0Init)


{-| initModel
Add components here
-}
initModel : Env -> $0Init -> Model
initModel _ _ =
    { components = []
    }


{-| Handle component messages (that are sent to this layer).
-}
handleComponentMsg : Env -> ComponentMsg -> Model -> ( Model, List ( LayerTarget, LayerMsg ), Env )
handleComponentMsg env _ model =
    ( model, [], env )


{-| updateModel
Default update function

Add your logic to handle Msg here

-}
updateModel : Env -> Model -> ( Model, List ( LayerTarget, LayerMsg ), Env )
updateModel env model =
    updateComponentsByHandler env model handleComponentMsg


{-| updateModelRec
Default update function

Add your logic to handle LayerMsg here

-}
updateModelRec : Env -> LayerMsg -> Model -> ( Model, List ( LayerTarget, LayerMsg ), Env )
updateModelRec env _ model =
    ( model, [], env )


{-| viewModel
Default view function

If you don't have components, remove viewComponent.

If you have other elements than components, add them after viewComponent.

-}
viewModel : Env -> Model -> Renderable
viewModel env model =
    viewComponent (noCommonData env) model.components
