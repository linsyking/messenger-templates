module SceneProtos.$0.GameComponents.$1.Model exposing
    ( initModel
    , updateModel
    , viewModel
    )

import Canvas exposing (empty)
import Dict
import Lib.Env.Env exposing (Env, EnvC)
import SceneProtos.$0.GameComponent.Base exposing (Data, GameComponentInitData(..))
import SceneProtos.$0.LayerBase exposing (CommonData)


{-| initModel

Initialize the model. It should update the id.

-}
initModel : Env -> GameComponentInitData -> Data
initModel _ initData =
    case initData of
        GCIdData id (GC$1InitData _) ->
            { uid = id
            , alive = True
            , extra = Dict.empty
            }

        _ ->
            { uid = 0
            , alive = True
            , extra = Dict.empty
            }


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
