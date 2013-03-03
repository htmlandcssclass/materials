$ ->

  $('.controls-toggle').click ->
    $('#controls').toggleClass('closed');

  controlsEl = $('#rule')
  { @rule, @property, @comment, @range, @select } = new CssControls.Factory(controlsEl).DSL

  @rule '#layout-0 .section-1', [
    @property 'float',
      enabled: true
      value: 'none'
      input: @select('none', 'left', 'right')

    @property 'width',
      enabled: true
      value: 'auto'
      input: @select('auto', '100px', '200px', '300px', '400px')

    @property 'height',
      enabled: true
      value: '100px'
      input: @select('100px', '200px', '300px')
  ]

  @rule '#layout-0 .section-2', [
    @property 'float',
      enabled: true
      value: 'none'
      input: @select('none', 'left', 'right')

    @property 'width',
      enabled: true
      value: 'auto'
      input: @select('auto', '100px', '200px', '300px', '400px')

    @property 'height',
      enabled: true
      value: '100px'
      input: @select('100px', '200px', '300px')
  ]

  @rule '#layout-0 .section-3', [
    @property 'float',
      enabled: true
      value: 'none'
      input: @select('none', 'left', 'right')

    @property 'width',
      enabled: true
      value: 'auto'
      input: @select('auto', '100px', '200px', '300px', '400px')

    @property 'height',
      enabled: true
      value: '100px'
      input: @select('100px', '200px', '300px')
  ]
