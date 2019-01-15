-- vim: fdm=marker

local bind = require('bind')

local function reloadHammerspoonConfig()
  hs.console.clearConsole()
  hs.reload()
end

-- Press shortcut key to reload config
bind.altShift('r', reloadHammerspoonConfig)

-- Reload config automatically
local function reloadIfNeeded(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

--configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadIfNeeded):start()

return {
  reload = reloadHammerspoonConfig
}
