toggleMenu = ->
  i = $ '.transform-icon'
  i.click ->
    $(@).children().toggleClass 'active'
    $('.sidebar').toggleClass 'active'

$ toggleMenu
