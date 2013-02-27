$ ->
  selector = 'p'
  propertiesEl = $('#properties')
  displayEl = $(selector);
  $('.selector').text(selector)

  property = (property, options) ->
    prop = new PropertyControl property, displayEl, options
    propertiesEl.append(prop.render().el)

  comment = (comment, spacer = true) ->
    classes = ['control']
    classes.push 'spacer' if spacer
    propertiesEl.append("<div class='#{classes.join(' ')}'><code class='disabled'>// #{comment}</code></div>")

  select = (options...) ->
    optionsMarkup = _(options).reduce((memo, value) ->
      memo += "<option>#{value}</option>"
    , '')
    '<select class="value">' + optionsMarkup + '</select>'

  range = (value = 50, min = 0, max = 100) ->
    "<input type='range' class='value' min='#{min}' max='#{max}' value='#{value}' />"

  comment 'layout', false
  property 'display',
    enabled: true
    value: 'block'
    disabledValue: 'block'
    input: select('block', 'inline', 'none')

  property 'position',
    value: 'static'
    disabledValue: 'static'
    input: select('static', 'relative', 'absolute', 'fixed')

  property 'padding',
    enabled: true
    value: 15
    disabledValue: 0
    input: range(15, 0, 50)

  property 'margin',
    enabled: true
    value: 15
    disabledValue: 0
    input: range(15, 0, 50)

  property 'width',
    value: 400
    input: range(400, 0, 600)

  property 'height',
    value: 200
    input: range(200, 0, 600)

  property 'top',
    value: 0
    input: range(0, 0, 600)

  property 'left',
    value: 0
    input: range(0, 0, 600)

  property 'z-index',
    value: 0
    measuredInPixels: false
    input: range(0, 0, 150)


  comment 'decoration'
  property 'border',
    value: '1px solid #ccc'
    disabledValue: 'none'

  property 'background-color',
    enabled: true
    value: '#eee'
    disabledValue: 'transparent'


  comment 'typography'
  property 'text-decoration',
    value: 'none'
    disabledValue: 'none'
    input: select 'none', 'underline', 'overline', 'line-through'

  property 'font-weight',
    value: 'bold'
    disabledValue: 'normal'
    input: select 'bold', 'normal'

  property 'line-height',
    value: 16
    input: range 16, 0, 50

  $('.controls-toggle').click ->
    $('#controls').toggleClass('closed');
