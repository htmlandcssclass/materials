$ ->

  $('.controls-toggle').click ->
    $('#controls').toggleClass('closed');

  controlsEl = $('#rule')
  { @rule, @property, @comment, @range, @select } = new CssControls.Factory(controlsEl).DSL

  @rule '#second-paragraph', [
    @comment 'layout', false
    @property 'display',
      enabled: true
      value: 'block'
      input: @select('block', 'inline', 'none')

    @property 'position',
      value: 'static'
      input: @select('static', 'relative', 'absolute', 'fixed')

    @property 'padding',
      enabled: true
      value: 15
      input: @range(15, 0, 50)

    @property 'margin',
      enabled: true
      value: 15
      input: @range(15, 0, 50)

    @property 'width',
      value: 400
      input: @range(400, 0, 600)

    @property 'height',
      value: 200
      input: @range(200, 0, 600)

    @property 'top',
      value: 0
      input: @range(0, 0, 600)

    @property 'left',
      value: 0
      input: @range(0, 0, 600)

    @property 'z-index',
      value: 0
      measuredInPixels: false
      input: @range(0, 0, 150)


    @comment 'decoration'
    @property 'border',
      value: '1px solid #ccc'

    @property 'background-color',
      enabled: true
      value: '#eee'


    @comment 'typography'
    @property 'text-decoration',
      value: 'none'
      input: @select 'none', 'underline', 'overline', 'line-through'

    @property 'font-weight',
      value: 'bold'
      input: @select 'bold', 'normal'

    @property 'line-height',
      value: 16
      input: @range 16, 0, 50
  ]
