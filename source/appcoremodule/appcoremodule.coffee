############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("appcoremodule")
#endregion

############################################################
import * as S from "./statemodule.js"
import * as nav from "./navmodule.js"

############################################################
export initialize = ->
    log "initialize"
    S.addOnChangeListener("navState", navStateChanged)
    return

############################################################
navStateChanged = ->
    log "navStateChanged"
    navState = S.get("navState")
    olog navState
    switch navState.base
        when "Root State" then S.set("uiState", "root:#{navState.modifier}")
        when "Next State" then S.set("uiState", "next:#{navState.modifier}")

    return

############################################################
export startUp = ->
    log "startUp"
    ## TODO implement
    return


############################################################
export triggerRootState = ->
    log "triggerRootState"
    await nav.backToRoot()
    navStateChanged()
    ## other appCore Logic...

    return

export triggerNextState = ->
    log "nextStateButtonClicked"
    await nav.addStateNavigation("Next State")
    navStateChanged()
    ## other appCore Logic...
    return
 
export triggerMenu = ->
    log "menuButtonClicked"
    await nav.addModification("menu")
    navStateChanged()
    ## other appCore Logic...
    return

export triggerPopup = ->
    log "popupButtonClicked"
    await nav.addModification("popup")
    navStateChanged()
    ## other appCore Logic...
    return

export triggerUnmodify = ->
    log "popupButtonClicked"
    await nav.unmodify()
    navStateChanged()
    ## other appCore Logic...
    return
