############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("appsimulationmodule")
#endregion

############################################################
import * as app from "./appcoremodule.js"

############################################################
export initialize = ->
    log "initialize"
    rootStateButton.addEventListener("click", rootStateButtonClicked)
    nextStateButton.addEventListener("click", nextStateButtonClicked)
    menuButton.addEventListener("click", menuButtonClicked)
    popupButton.addEventListener("click", popupButtonClicked)
    appUnmodifier.addEventListener("click", appUnmodifierClicked)

    return

############################################################
#region EventListeners
rootStateButtonClicked = (evnt) ->
    log "rootStateButtonClicked"
    app.triggerRootState()
    return

nextStateButtonClicked = (evnt) ->
    log "nextStateButtonClicked"
    app.triggerNextState()
    return
 
menuButtonClicked = (evnt) ->
    log "menuButtonClicked"
    app.triggerMenu("menu")
    return

popupButtonClicked = (evnt) ->
    log "popupButtonClicked"
    app.triggerPopup("popup")
    return

appUnmodifierClicked = ->
    log "appUnmodifierClicked"
    app.triggerUnmodify()
    return

#endregion

############################################################
export setContent = (content) ->
    log "setContent"
    appContent.textContent = content
    return

############################################################
#region UI State Setter functions
export setRootState = ->
    log "setRootState"
    appsimulation.classList.remove("next")
    appsimulation.classList.remove("menu-on")
    appsimulation.classList.remove("popup-on")
    appsimulation.classList.add("root")
    return

############################################################
export setNextState = ->
    log "setNextState"
    appsimulation.classList.remove("root")
    appsimulation.classList.remove("menu-on")
    appsimulation.classList.remove("popup-on")
    appsimulation.classList.add("next")
    return

############################################################
export setMenuOn = ->
    log "setMenuOn"
    appsimulation.classList.add("menu-on")
    return

export setMenuOff = ->
    log "setMenuOff"
    appsimulation.classList.remove("menu-on")
    return

export setPopupOn = ->
    log "setPopupOn"
    appsimulation.classList.add("popup-on")
    return

export setPopupOff = ->
    log "setPopupOff"
    appsimulation.classList.remove("popup-on")
    return

#endregion