class window.PropertyControl

  constructor: (@property, @controlEl, @displayEl, options) ->
    { @initialValue, @disabledValue } = options
    @initialValue ?= 0
    @disabledValue ?= 'initial'

    @enabledInput = @controlEl.find("[name=#{property}-enabled]")
    @valueInput = @controlEl.find("[name=#{property}-value]")
    @valueOutput = @controlEl.find('.value')

    @enabledInput.on 'change', @enableOrDisable
    @valueInput.on 'change', @pullValueFromInput

    @value = @initialValue
    @enableOrDisable()

  showValue: (value) ->
    @valueOutput.text(@formattedValue(value))
    @displayEl.css(@property, @formattedValue(value))

  enableOrDisable: =>
    disabled = !@enabledInput.is(':checked')
    @controlEl.toggleClass('disabled', disabled)
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
    if isANumber then value+'px' else value
