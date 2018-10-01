@colorPicker = ->
  $('#color').minicolors()
  changeSiteColor()
  $("#color").change ->
    color = @.value
    $.ajax
      url: "site_color"
      type: "GET"
      data:
        'color' : color

changeSiteColor = ->
  $('.color').click ->
    code = $(@).html()
    $('#color').val(code).change()
