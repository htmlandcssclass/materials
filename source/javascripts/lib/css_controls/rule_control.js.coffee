window.CssControls ?= {}

class window.CssControls.RuleControl
  constructor: (@selector, @properties) ->

  render: ->
    matchedElements = $(@selector)
    @el = $('<code><span class="selector">'+@selector+'</span> {</code>')
    for prop in @properties
      prop.setMatchedElements matchedElements if prop.setMatchedElements?
      @el.append(prop.render().el)
    @el.append('<code>}</code>')
    @