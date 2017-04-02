local menu = hs.chooser.new(function(selectedContents)
    hs.alert.show(selectedContents.text)
end)

menu:choices {
  {
    text = 'Open in firefox',
    subText = 'Open bookmarks in firefox'
  },
  {
    text = 'Mudox',
    subText = 'Open bookmarks in firefox'
  }
}

menu:searchSubText(true)

return menu
