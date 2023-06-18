module Components.$0.Export exposing (initComponent)

{-| Component Export

Write a description here for how to use your component.

@docs initComponent

-}

import Components.$0.$1 exposing (initModel, updateModel, updateModelRec, viewModel)
import Lib.Component.Base exposing (Component, ComponentInitData)
import Lib.Env.Env exposing (Env)


{-| initComponent
Write a description here for how to initialize your component.
-}
initComponent : Env -> ComponentInitData -> Component
initComponent env i =
    { name = "$1"
    , data = initModel env i
    , update = updateModel
    , updaterec = updateModelRec
    , view = viewModel
    }
