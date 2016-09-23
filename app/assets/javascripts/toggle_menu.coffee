toggleMenu = ->
  i = $ '.transform-icon'
  i.click ->
    # $(@).children().toggleClass 'active'
    $(@).toggleClass 'active'
    $('.sidebar').toggleClass 'active'
    $('.wtf').toggleClass 'active'

$ toggleMenu
