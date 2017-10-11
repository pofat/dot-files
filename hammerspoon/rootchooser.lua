local menu = hs.chooser.new(function(selectedContents)
  if selectedContents then
    if selectedContents.text == 'Console' then
      hs.openConsole(true)
    else
      hs.alert.show(selectedContents.text)
    end
  end
end)

menu:choices {
  {
    text = 'Github Stars',
    subText = 'Open github stars in firefox'
  },
  {
    text = 'Firefox Bookmarks',
    subText = 'Open firefox bookmarks in firefox'
  },
  {
    text = 'Console',
    subText = 'Show Hammerspoon Console'
  }
}

menu:searchSubText(true)

return menu
