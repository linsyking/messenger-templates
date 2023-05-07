module Components.$0.Export exposing (initComponent)

{-|
Component Export

Write a description here for how to use your component.

@docs initComponent

-}

import Components.$0.$0 exposing (initModel, updateModel, viewModel)
import Lib.Component.Base exposing (Component, ComponentTMsg(..))
import Lib.Tools.Maybe exposing (just2)


{-| initComponent
Write a description here for how to initialize your component.

-}
initComponent : Int -> Int -> ComponentTMsg -> Component
initComponent t id ct =
    { name = "$0"
    , data = initModel t id ct
    , init = initModel
    , update = updateModel
    , view = just2 viewModel
    }
