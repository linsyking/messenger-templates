module Components.$0.$0 exposing (
    initModel,
    updateModel,
    viewModel
)

{-| Component

This is a component model module. It should define init, update and view model.

@docs initModel
@docs updateModel
@docs viewModel

-}

import Base exposing (GlobalData, Msg)
import Canvas exposing (Renderable, group)
import Dict
import Lib.Component.Base exposing (ComponentTMsg(..), ComponentTarget(..), Data, DefinedTypes(..))


{-| initModel

Initialize the model. It should update the id.

-}
initModel : Int -> Int -> ComponentTMsg -> Data
initModel _ id _ =
    Dict.fromList
        [ ( "id", CDInt id )
        ]


{-| updateModel

Add your component logic here.

-}
updateModel : Msg -> GlobalData -> ComponentTMsg -> ( Data, Int ) -> ( Data, List ( ComponentTarget, ComponentTMsg ), GlobalData )
updateModel _ gd _ ( d, _ ) =
    ( d, [], gd )


{-| viewModel

Change this to your own component view function.

If there is no view function, remove this and change the view function in export module to nothing.

-}
viewModel : ( Data, Int ) -> GlobalData -> Maybe Renderable
viewModel _ _ =
    Nothing
