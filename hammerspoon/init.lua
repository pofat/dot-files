local alt = {"alt"}
local altShift = {"alt", "shift"}
local cmdAlt = {"cmd", "alt"}

-- disable window animation
hs.window.animationDuration = 0

-- reload
hs.hotkey.bind(altShift, 'r', function ()
  hs.reload()
end)


-- focus or launch application
-- commonly used applications
-- hotkey
local shortcuts = {

  --
  -- alt the main applications in my everyday workflow
  --

  {alt, 1  , 'Firefox'}          ,
  {alt, 2  , 'Xcode'}            ,
  {alt, 3  , 'Microsoft OneNote'},
  {alt, 4  , 'Focus Matrix'}     ,

  {alt, 's', 'Screen Sharing'}   ,
  {alt, 'g', 'Google Chrome'}    ,
  {alt, 't', 'Tower'}            ,

  -- switch hand

  {alt   , 7, 'Preview'}                   ,
  -- {alt, 8, ...} is left for the Dash app
  {alt   , 9, 'Quiver'}                    ,
  {alt   , 0, 'Finder'}                    ,

  --
  -- alt + shift for relatively less commonly used applications
  --

  {altShift, 1  , 'Simulator'}  ,
  {altShift, 2  , 'Paw'}        ,

  {altShift, 'g', 'OmniGraffle'},
  {altShift, 's', 'Sketch'}     ,
  {altShift, 'q', 'Quiver'}     ,

  -- switch hand

  --{altShift, 9, 'Paw'}

  --
  -- cmd + alt for relatively less commonly used applications
  --

  {cmdAlt, 'p'  , 'Paw'}  ,


}

for i = 1, #shortcuts do
  local shortcut = shortcuts[i]
  local combo = shortcut[1]
  local key = tostring(shortcut[2])
  local name = shortcut[3]
  --hs.hotkey.bind(combo, key, function () hs.application.launchOrFocus(name) end)
  hs.hotkey.bind(combo, key, function () toggleApp(name) end)
end

function toggleApp(name)
  local app = hs.application.get(name)
  if app and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(name)
    --hs.application.get(name):focusedWindow():maximize()
  end
end

-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 7
hs.grid.GRIDHEIGHT = 3

-- alert default style
hs.alert.defaultStyle.radius = 4
hs.alert.defaultStyle.strokeWidth = 0.5

-- root chooser
rootChooser = require('rootchooser')
hs.hotkey.bind(altShift, 'space', function () rootChooser:show() end)

-- github stars fetcher
githubStars = require('githubstars')
hs.hotkey.bind(altShift, 'x', function () githubStars:fetchStarsPagesInfo() end)

hs.alert.show('Hammerspoon config reloaded')
