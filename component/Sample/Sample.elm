module Components.$0.$1 exposing
    ( initModel
    , updateModel, updateModelRec
    , viewModel
    )

{-| Component

This is a component model module. It should define init, update and view model.

@docs initModel
@docs updateModel, updateModelRec
@docs viewModel

-}

import Canvas exposing (Renderable, empty)
import Dict
import Lib.Component.Base exposing (ComponentInitData(..), ComponentMsg, ComponentTarget(..), ComponentTypes(..), Data, nullData)
import Lib.DefinedTypes.DefTypes exposing (DefinedTypes(..))
import Lib.Env.Env exposing (Env)


{-| initModel

Initialize the model. It should update the id.

-}
initModel : Env () -> ComponentInitData -> Data
initModel _ i =
    case i of
        ComponentID id _ ->
            { uid = id
            , sublist = []
            , extra =
                Dict.fromList []
            }

        _ ->
            nullData


{-| updateModel

Add your component logic to handle Msg here.

-}
updateModel : Env () -> Data -> ( Data, List ( ComponentTarget, ComponentMsg ), Env () )
updateModel env d =
    ( d, [], env )


{-| updateModelRec

Add your component logic to handle ComponentMsg here.

-}
updateModelRec : Env () -> ComponentMsg -> Data -> ( Data, List ( ComponentTarget, ComponentMsg ), Env () )
updateModelRec env _ d =
    ( d, [], env )


{-| viewModel

Change this to your own component view function.

If there is no view function, return Nothing.

-}
viewModel : Env () -> Data -> Renderable
viewModel _ _ =
    empty
