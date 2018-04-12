simpleMDE = null

$(document).on "turbolinks:before-visit",->
  if simpleMDE?
    simpleMDE.toTextArea()
    simpleMDE = null
$(document).on "turbolinks:load", ->
  simpleMDE = new SimpleMDE()