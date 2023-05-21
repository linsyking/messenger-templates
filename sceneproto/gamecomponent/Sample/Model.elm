module SceneProtos.$0.GameComponents.$1.Model exposing (initModel, updateModel, viewModel)

{-|


# Model for this GameComponent

@docs initModel, updateModel, viewModel

-}
import Canvas exposing (Renderable, empty)
import Lib.Env.Env exposing (Env, EnvC)
import SceneProtos.$0.GameComponent.Base exposing (Data, GameComponentInitData(..), GameComponentMsg, GameComponentTarget, nullData)
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| initModel

Initialize the model. It should update the id.

-}
initModel : Env -> GameComponentInitData -> Data
initModel _ initData =
    case initData of
        GCIdData _ (GCButInitData _) ->
            -- Change this to initialize your GC
            nullData

        _ ->
            nullData


{-| updateModel

Add your component logic here.

-}
updateModel : EnvC CommonData -> GameComponentMsg -> Data -> ( Data, List ( GameComponentTarget, GameComponentMsg ), EnvC CommonData )
updateModel env _ d =
    ( d, [], env )


{-| viewModel

Change this to your own component view function.

If there is no view function, return Nothing.

-}
viewModel : EnvC CommonData -> Data -> Renderable
viewModel _ _ =
    empty
