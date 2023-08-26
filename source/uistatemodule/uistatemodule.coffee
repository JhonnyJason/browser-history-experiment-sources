############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("uistatemodule")
#endregion

############################################################
import *  as S from "./statemodule.js"

############################################################
import * as appSimulation from "./appsimulationmodule.js"

############################################################
applyState = {}

############################################################
export initialize = ->
    log "initialize"
    S.addOnChangeListener("uiState", applyUIState)
    return

############################################################
applyUIState = ->
    log "applyUIState"
    uiState = S.get("uiState")
    applyFunction = applyState[uiState]
    if typeof applyFunction != "function" then throw new Error("on applyUIState: uiState '#{uiState}' did not have an apply function!")
    
    applyFunction()
    return

############################################################
#region applyState functions
applyState["root:none"] = ->
    appSimulation.setRootState()
    return

applyState["root:menu"] = ->
    appSimulation.setRootState()
    appSimulation.setMenuOn()
    return

applyState["root:popup"] = ->
    appSimulation.setRootState()
    appSimulation.setPopupOn()
    return

applyState["next:none"] = ->
    appSimulation.setNextState()
    return

applyState["next:menu"] = ->
    appSimulation.setNextState()
    appSimulation.setMenuOn()
    return

applyState["next:popup"] = ->
    appSimulation.setNextState()
    appSimulation.setPopupOn()
    return

#endregion
