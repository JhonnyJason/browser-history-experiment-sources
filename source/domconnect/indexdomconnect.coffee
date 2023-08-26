indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.navstatedisplay = document.getElementById("navstatedisplay")
    global.appsimulation = document.getElementById("appsimulation")
    global.appUnmodifier = document.getElementById("app-unmodifier")
    global.rootStateButton = document.getElementById("root-state-button")
    global.nextStateButton = document.getElementById("next-state-button")
    global.menuButton = document.getElementById("menu-button")
    global.popupButton = document.getElementById("popup-button")
    return
    
module.exports = indexdomconnect