local alt = {"alt"}
local altShift = {"alt", "shift"}
local cmdAlt = {"cmd", "alt"}

-- disable window animation
hs.window.animationDuration = 0

-- reload
hs.hotkey.bind(altShift, 'r', function ()
  hs.console.clearConsole()
  hs.reload()
end)


--
-- commonly used app quick switching
--

local appShortcuts = {

  --
  -- alt + num to swtich the main applications in my everyday life
  --

  {alt, 1, 'Firefox'}          ,
  {alt, 2, 'Xcode'}            ,
  {alt, 3, 'Microsoft OneNote'},
  {alt, 4, 'Things'}           ,
  {alt, 5, 'Preview'}          ,

  {alt, 'g', 'Google Chrome'},
  {alt, 's', 'Sourcetree'}   ,

  -- switch hand

  -- 7 is occpuied by the Pastes.app
  -- 8 is occupied by the Dash.app
  {alt, 0, 'Finder'},

  --
  -- alt + shift + num for relatively less commonly used applications
  --

  {altShift, 1  , 'Simulator'}  ,
  {altShift, 2  , 'Paw'}        ,

  {altShift, 'g', 'OmniGraffle'},
  {altShift, 's', 'Sketch'}     ,
  {altShift, 'q', 'Quiver'}     ,

  -- switch hand

  --
  -- cmd + alt for relatively less commonly used applications
  --

  {cmdAlt, 'p'  , 'Paw'}  ,


}

for i = 1, #appShortcuts do
  local shortcut = appShortcuts[i]
  local combo = shortcut[1]
  local key = tostring(shortcut[2])
  local name = shortcut[3]
  --hs.hotkey.bind(combo, key, function () hs.application.launchOrFocus(name) end)
  hs.hotkey.bind(combo, key, function () toggleApp(name) end)
end

-- Show / hide application
hs.application.enableSpotlightForNameSearches(true)
function toggleApp(name)
  local app = hs.application.get(name)
  if app then -- application is running
    if app:isFrontmost() then -- application is the focused application
      app:hide()
    else
      if not app:activate() then
        hs.alert.show(string.format('Can not bring [%s] to front', name))
      end
    end
  else
    if not hs.application.launchOrFocus(name) then
        hs.alert.show(string.format('Can not find application [%s]', name))
    end
  end
end

-- Test: use this to maximize app window instead of `BetterSnapTool` app
hs.hotkey.bind(altShift, 'f', function()
  local appWindow = hs.window.focusedWindow()

  if appWindow then
    appWindow:setFrame(appWindow:screen():frame())
  else
    hs.alert.show('no focused window found')
  end
end)

-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 7
hs.grid.GRIDHEIGHT = 3

-- alert default style
hs.alert.defaultStyle.radius = 4
hs.alert.defaultStyle.strokeWidth = 0.5

-- Hammerspoon console

hs.hotkey.bind(altShift, 'x', function () hs.openConsole(true) end)

--hs.console.outputBackgroundColor { white = 0 }
--hs.console.consoleCommandColor   { white = 1 }
--hs.console.windowBackgroundColor { white = 0 }

-- root chooser
rootChooser = require('rootchooser')
hs.hotkey.bind(altShift, 'space', function () rootChooser:show() end)

-- github stars fetcher
--githubStars = require('githubstars')
--hs.hotkey.bind(altShift, 'x', function () githubStars:fetchStarsPagesInfo() end)

hs.alert.show('Hammerspoon config reloaded')
