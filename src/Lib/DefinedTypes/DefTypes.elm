module Lib.DefinedTypes.DefTypes exposing (DefinedTypes(..))

{-|


# DefTypes

DefinedTypes

@docs DefinedTypes

-}

import Color exposing (Color)
import Dict exposing (Dict)


{-| DefinedTypes

Defined type is used to store more data types in components or gamecomponents.

Those entries are the commonly used data types.

Note that you shouldnot use Data types about Components or GameComponents here.

-}
type DefinedTypes
    = DTInt Int
    | DTBool Bool
    | DTFloat Float
    | DTString String
      -- | DTComponent Component
      -- | DTComponentMsg ComponentMsg
      -- | DTComponentTarget ComponentTarget
    | DTColor Color
    | DTListDT (List DefinedTypes)
    | DTDictDT (Dict String DefinedTypes)
