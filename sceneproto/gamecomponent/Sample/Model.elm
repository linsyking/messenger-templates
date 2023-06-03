module SceneProtos.$0.GameComponents.$1.Model exposing (initModel, updateModel, viewModel)

{-|


# Model for this GameComponent

@docs initModel, updateModel, viewModel

-}
import Canvas exposing (Renderable)
import Lib.Env.Env exposing (Env, EnvC)
import SceneProtos.$0.GameComponent.Base exposing (Data, GameComponentInitData(..), GameComponentMsg, GameComponentTarget, nullData)
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| initModel

Initialize the model. It should update the id.

-}
initModel : Env -> GameComponentInitData -> Data
initModel _ initData =
    case initData of
        GCIdData _ (GC$1InitData _) ->
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

-}
viewModel : EnvC CommonData -> Data -> List ( Renderable, Int )
viewModel _ _ =
    []
