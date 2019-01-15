local logger = hs.logger.new('rootchooser', 'verbose')

local titleReloadConfig = "Reload Hammerspoon Config"
local titleOpenHammerspoonConsole = "Show Hammerspoon Console"
local titleUnmountTimeCapsule = "Unmount Time Capsule"

function getPassword()
  if currentUserPassword then
    return currentUserPassword
  end

  local _, password = hs.dialog.textPrompt("Enter user password", "")
  local cmd = string.format('echo "%s\\n" | sudo -S diskutil list', password)
  local _, ret = hs.execute('diskutil list')

  if ret then
    currentUserPassword = password
    return currentUserPassword
  else
    return nil
  end
end

local function unmountTimeCapsule()
  local alert = hs.alert.show

  local text = hs.execute('diskutil list')
  local volume = text:match('Time Capsule.+(disk%ds%d)')
  if not volume then
    alert('Can not found volume named "Time Capsule"')
    return
  end

  disk = volume:sub(1, 5)

  local cmd = string.format('echo "%s\\n" | sudo -S diskutil unmountDisk %s', getPassword(), disk)
  local echo, ret = hs.execute(cmd)

  if ret then
    alert('Time Capsule disk is removed')
  else
    alert('Failed to remove Time Capsule disk')
  end
end

local function openHammerspoonConsole()
  hs.openConsole(true)
end

local menu = hs.chooser.new(function(item)
  if not item then return end

  if item.text == titleUnmountTimeCapsule  then
    unmountTimeCapsule()
  elseif item.text == titleOpenHammerspoonConsole then
    openHammerspoonConsole()
  elseif item.text == titleReloadConfig then
    require('config').reload()
  end
end)

menu:choices {
  {
    text = titleReloadConfig,
    subText = 'Clear console and then start reloading (⇧ +⌥ + R)',
    image = hs.image.imageFromAppBundle('org.hammerspoon.Hammerspoon'),
  },
  {
    text = titleOpenHammerspoonConsole,
    subText = 'Toggle console with (⇧ +⌥ + X)',
    image = hs.image.imageFromAppBundle('org.hammerspoon.Hammerspoon'),
  },
  {
    text = titleUnmountTimeCapsule,
    subText = 'Would ask your for user password',
    image = hs.image.imageFromName('NSComputer'),
  },
}

menu:searchSubText(true)

return menu
