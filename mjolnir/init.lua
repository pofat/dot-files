local app   = require "mjolnir.application"
local key   = require "mjolnir.hotkey"
local win   = require "mjolnir.window"
local futl  = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local grid  = require "mjolnir.bg.grid"


-- Set up hotkey combinations
local a_s = {"alt", "shift"}
local c_s= {"ctrl", "shift"}

-- Set grid size.
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 3
grid.MARGINX    = 0
grid.MARGINY    = 0

key.bind(a_s, "R", function() mjolnir.reload() end)

key.bind(a_s, "L", function() win.focusedwindow():focuswindow_east() end)
key.bind(a_s, "H", function() win.focusedwindow():focuswindow_west() end)
key.bind(a_s, "K", function() win.focusedwindow():focuswindow_north() end)
key.bind(a_s, "J", function() win.focusedwindow():focuswindow_south() end)

key.bind(a_s, ';', function() grid.snap(win.focusedwindow()) end)
key.bind(a_s, "'", function() futl.map(win.visiblewindows(), grid.snap) end)
key.bind(a_s, '=', function() grid.adjustwidth( 1) end)
key.bind(a_s, '-', function() grid.adjustwidth(-1) end)

key.bind(a_s, 'M', grid.maximize_window)

key.bind(a_s, 'N', grid.pushwindow_nextscreen)
key.bind(a_s, 'P', grid.pushwindow_prevscreen)

key.bind(c_s, 'J', grid.pushwindow_down)
key.bind(c_s, 'K', grid.pushwindow_up)
key.bind(c_s, 'H', grid.pushwindow_left)
key.bind(c_s, 'L', grid.pushwindow_right)

key.bind(a_s, 'D', grid.pushwindow_down)
key.bind(a_s, 'E', grid.pushwindow_up)
key.bind(a_s, 'S', grid.pushwindow_left)
key.bind(a_s, 'F', grid.pushwindow_right)

key.bind(a_s, 'U', grid.resizewindow_taller)
key.bind(a_s, 'O', grid.resizewindow_wider)

key.bind(a_s, 'I', grid.resizewindow_thinner)
key.bind(a_s, 'Y', grid.resizewindow_shorter)

-- Hi there.
alert.show("Mjolnir, at your service.")
