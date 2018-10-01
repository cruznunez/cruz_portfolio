logIn = ->
  window.location.href = "/v1/log_in"

logOut = ->
  window.location.href = "/v1/log_out"

users = ->
  window.location.href = "/v1/users"

tech = ->
  window.location.href = "/v1/technologies"

colors = ->
  window.location.href = "/v1/colors"

keyBoardListener = ->
  listener = new window.keypress.Listener()
  listener.sequence_combo "l o g i", logIn
  listener.sequence_combo "l o g o", logOut
  listener.sequence_combo "u s e r", users
  listener.sequence_combo "t e c h", tech
  listener.sequence_combo "c o l o r", colors

$ keyBoardListener
