class window.PropertyControl

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

  constructor: (@property, @displayEl, @options) ->
    { @value, @disabledValue } = @options
    @value            ?= 0
    @disabledValue    ?= 'initial'
    @measuredInPixels ?= true

  showValue: (value) ->
    @valueOutput.text(@formattedValue(value))
    @displayEl.css(@property, @formattedValue(value))

  enableOrDisable: =>
    disabled = !@enabledInput.is(':checked')
    console.log @enabledInput[0]
    @el.toggleClass('disabled', disabled)
    @valueInput.prop('disabled', disabled)
    if (disabled)
      @showValue(@disabledValue)
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