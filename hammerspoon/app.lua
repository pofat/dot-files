-- vim: fdm=marker

local bind = require('bind')

local alt = {"alt"}
local altShift = {"alt", "shift"}
local cmdAlt = {"cmd", "alt"}

-- Show / hide application

local function toggleApp(name)
  hs.application.enableSpotlightForNameSearches(true)

  local app = hs.application.get(name)
  if app then -- App is running
    if app:isFrontmost() then -- application is the focused application
      app:hide()
    else
      if not app:activate() then
        hs.alert.show(string.format('Can not bring [%s] to front', name))
      end
    end
  else -- App is not running, launch and focus it
    if not hs.application.launchOrFocus(name) then
      hs.alert.show(string.format('Can not find application [%s]', name))
    end
  end
end

-- Maximize app window

bind.altShift('f', function()
  local appWindow = hs.window.focusedWindow()

  if appWindow then
    appWindow:setFrame(appWindow:screen():frame())
  else
    hs.alert.show('no focused window found')
  end
end)

--- App Shortcusts {{{1

local appShortcuts = {

  --
  -- alt + num to swtich the main applications in my everyday life
  --
  {alt, 'x', 'Xcode'}              ,
  {alt, 'g', 'Google Chrome'}      ,
  {alt, 't', 'Tower'}              ,
  {alt, 'p', 'Paw'}                ,
  {alt, 'v', 'Visual Studio Code'} ,

  {alt, 1  , 'Firefox'}            ,
  {alt, 3  , 'Microsoft OneNote'}  ,
  {alt, 4  , 'Things3'}            ,
  {alt, 5  , 'Preview'}            ,

  -- switch hand

  -- 7 is occpuied by the Pastes.app
  -- 8 is occupied by the Dash.app
  {alt, 0, 'Finder'},

  --
  -- alt + shift + num for relatively less commonly used applications
  --

  {altShift, 1  , 'Simulator'}  ,
  {altShift, 2  , 'Paw'}        ,
  {altShift, 3  , 'YoudaoDict'} ,

  {altShift, 'g', 'OmniGraffle'},
  {altShift, 's', 'Sketch'}     ,

  -- switch hand

  --
  -- cmd + alt for relatively less commonly used applications
  --

  {cmdAlt, 'p'  , 'Paw'}  ,

}

-- Register app switching shortcuts

for i = 1, #appShortcuts do
  local shortcut = appShortcuts[i]
  local combo = shortcut[1]
  local key = tostring(shortcut[2])
  local name = shortcut[3]
  hs.hotkey.bind(combo, key, function () toggleApp(name) end)
end

--- }}}

return {
  shortcuts = appShortcuts
}
