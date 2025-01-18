module GlobalComponents.$0.Model exposing (InitOption, genGC)

{-| Global component configuration module

@docs InitOption, genGC

-}

import Json.Encode as E
import Messenger.Component.GlobalComponent exposing (genGlobalComponent)
import Messenger.Scene.Scene exposing (ConcreteGlobalComponent, GCTarget, GlobalComponentInit, GlobalComponentStorage, GlobalComponentUpdate, GlobalComponentUpdateRec, GlobalComponentView)
import REGL


{-| Init Options
-}
type alias InitOption =
    {}


type alias Data =
    {}


init : InitOption -> GlobalComponentInit userdata scenemsg Data
init opt _ _ =
    ( {}
    , { dead = False
      , postProcessor = identity
      }
    )


update : GlobalComponentUpdate userdata scenemsg Data
update env evnt data bdata =
    ( ( data, bdata ), [], ( env, False ) )


updaterec : GlobalComponentUpdateRec userdata scenemsg Data
updaterec env _ data bdata =
    ( ( data, bdata ), [], env )


view : GlobalComponentView userdata scenemsg Data
view _ data _ =
    REGL.empty


gcCon : InitOption -> ConcreteGlobalComponent Data userdata scenemsg
gcCon opt =
    { init = init opt
    , update = update
    , updaterec = updaterec
    , view = view
    , id = "$0"
    }


{-| Generate a global component.
-}
genGC : InitOption -> Maybe GCTarget -> GlobalComponentStorage userdata scenemsg
genGC opt =
    genGlobalComponent (gcCon opt) E.null
