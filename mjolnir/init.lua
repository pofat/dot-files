local application = require "mjolnir.application"
local hotkey      = require "mjolnir.hotkey"
local window      = require "mjolnir.window"
local fnutils     = require "mjolnir.fnutils"
local alert       = require "mjolnir.alert"
local grid        = require "mjolnir.bg.grid"


-- Set up hotkey combinations
local a_s = {"alt" , "shift"}
local c_s = {"ctrl", "shift"}

-- Set grid size.
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 3
grid.MARGINX    = 0
grid.MARGINY    = 0

hotkey.bind(a_s, "R", function() mjolnir.reload() end)

-- jump between windows.
hotkey.bind(a_s, "L", function() window.focusedwindow():focuswindow_east() end)
hotkey.bind(a_s, "H", function() window.focusedwindow():focuswindow_west() end)
hotkey.bind(a_s, "K", function() window.focusedwindow():focuswindow_north() end)
hotkey.bind(a_s, "J", function() window.focusedwindow():focuswindow_south() end)

-- grid manipulation.
hotkey.bind(a_s, ';', function() grid.snap(window.focusedwindow()) end)
hotkey.bind(a_s, "'", function() fnutils.map(window.visiblewindows(), grid.snap) end)
hotkey.bind(a_s, '=', function() grid.adjustwidth( 1) end)
hotkey.bind(a_s, '-', function() grid.adjustwidth(-1) end)


-- transfer windows between screens.
hotkey.bind(a_s, 'N', grid.pushwindow_nextscreen)
hotkey.bind(a_s, 'P', grid.pushwindow_prevscreen)

-- move windows.
hotkey.bind(c_s, 'J', grid.pushwindow_down)
hotkey.bind(c_s, 'K', grid.pushwindow_up)
hotkey.bind(c_s, 'H', grid.pushwindow_left)
hotkey.bind(c_s, 'L', grid.pushwindow_right)

hotkey.bind(a_s, 'D', grid.pushwindow_down)
hotkey.bind(a_s, 'E', grid.pushwindow_up)
hotkey.bind(a_s, 'S', grid.pushwindow_left)
hotkey.bind(a_s, 'F', grid.pushwindow_right)

-- resize windows.
hotkey.bind(a_s, 'Y', grid.resizewindow_shorter)
hotkey.bind(a_s, 'U', grid.resizewindow_taller)

hotkey.bind(a_s, 'O', grid.resizewindow_wider)
hotkey.bind(a_s, 'I', grid.resizewindow_thinner)

hotkey.bind(a_s, 'M', grid.maximize_window)

-- open or raise applications.
hotkey.bind(c_s, 'F', function() application.launchorfocus("firefox") end)
hotkey.bind(c_s, 'I', function() application.launchorfocus("iterm") end)
hotkey.bind(c_s, 'V', function() application.launchorfocus("macvim") end)
