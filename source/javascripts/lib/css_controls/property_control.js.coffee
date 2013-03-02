window.CssControls ?= {}

class window.CssControls.PropertyControl

  template: _.template '''
    <div id="<%= property %>-control" class="control">
      <code class="output">
        <span class="property"><%= property %>:</span>
        <span class="value"></span>;
      </code>
      <div class="inputs">
        <input class="enabled" type="checkbox" <%= checked %> />
        <%= input %>
      </div>
    </div>
  '''

  constructor: (@property, @options) ->
    { @value } = @options
    @value            ?= 0
    @options.measuredInPixels ?= true

  setMatchedElements: (matchedElements) ->
    @matchedElements = matchedElements

  showValue: (value) ->
    return unless @matchedElements
    @matchedElements.css(@property, @formattedValue(value))
    @valueOutput.text(@matchedElements.css(@property))

  enableOrDisable: =>
    disabled = !@enabledInput.is(':checked')
    @el.toggleClass('disabled', disabled)
    @valueInput.prop('disabled', disabled)
    if (disabled)
      @showValue('')
    else
      @showValue(@value)

  pullValueFromInput: =>
    @value = @valueInput.val()
    @showValue(@value)

  formattedValue: (value) ->
    isANumber = value > 0 || value < 0
    if isANumber && @options.measuredInPixels
      value+'px'
    else
      value

  render: ->
    markup = @template
      property: @property
      checked: if @options.enabled then 'checked' else ''
      input: @options.input
    @el = $(markup)

    @enabledInput = @el.find('.enabled')
    @valueInput = @el.find('.inputs .value')
    @valueOutput = @el.find('.output .value')

    @enabledInput.on 'change', @enableOrDisable
    @valueInput.on 'change', @pullValueFromInput

    @enableOrDisable()
    @