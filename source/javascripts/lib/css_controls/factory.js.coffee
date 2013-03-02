window.CssControls ?= {}

class window.CssControls.Factory

  constructor: (@controlsEl) ->
    @DSL =
      rule: @createRule
      property: @createPropertyControl
      comment: @createComment
      select: @generateSelectMarkup
      range: @generateRangeMarkup

  createRule: (selector, properties) =>
    rule = new CssControls.RuleControl(selector, properties);
    @controlsEl.append rule.render().el
    rule

  createPropertyControl: (property, options) ->
    new CssControls.PropertyControl property, options

  createComment: (comment, spacer) ->
    new CssControls.Comment comment, spacer

  generateSelectMarkup: (options...) ->
    optionsMarkup = _(options).reduce((memo, value) ->
      memo += "<option>#{value}</option>"
    , '')
    '<select class="value">' + optionsMarkup + '</select>'

  generateRangeMarkup: (value = 50, min = 0, max = 100) ->
    "<input type='range' class='value' min='#{min}' max='#{max}' value='#{value}' />"