window.CssControls ?= {}

class window.CssControls.Comment

  constructor: (@comment, spacer = true) ->
    @classes = ['control']
    @classes.push 'spacer' if spacer

  render: ->
    @el = $("<div class='#{@classes.join(' ')}'><code class='disabled'>// #{@comment}</code></div>")
    @