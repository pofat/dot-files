-- vim: fdm=marker

local alt = {"alt"}
local altShift = {"alt", "shift"}
local cmdAlt = {"cmd", "alt"}

-- Disable window animation
hs.window.animationDuration = 0

-- Reload config
require('config')

-- Manage apps
require('app')

-- Alert default style
hs.alert.defaultStyle.radius = 4
hs.alert.defaultStyle.strokeWidth = 0.5

-- Hammerspoon console
hs.hotkey.bind(altShift, 'x', function () hs.openConsole(true) end)

-- Root chooser

rootChooser = require('rootchooser')

hs.hotkey.bind(alt, 'r', function ()
  rootChooser:show()
end)

hs.alert.show('Hammerspoon config reloaded')
