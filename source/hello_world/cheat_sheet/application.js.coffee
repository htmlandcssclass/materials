$ ->

  $('.controls-toggle').click ->
    $('#controls').toggleClass('closed');

  colorOptions = ['magenta', 'coral', 'teal', '#00FFFF', '#CCCCCC']
  imageOptions = ['none', 'url(nyan_cat.gif)', 'url(bling_stars.gif)', 'url(white_fur.png)']

  controlsEl = $('#rule')
  { @rule, @property, @comment, @range, @select } = new CssControls.Factory(controlsEl).DSL

  @rule 'body', [
    @property 'font-family',
      value: 'Helvetica'
      input: @select('Helvetica', 'Comic Sans MS')

    @property 'color',
      value: '#00FFFF'
      input: @select(colorOptions...)

    @property 'background-image',
      value: 'none'
      input: @select(imageOptions...)
  ]

  @rule '.container', [
    @property 'padding',
      value: 15
      input: @range(15, 0, 50)

    @property 'margin',
      value: 15
      input: @range(15, 0, 50)

    @property 'color',
      value: 'coral'
      input: @select(colorOptions...)

    @property 'background-color',
      value: '#CCCCCC'
      input: @select(colorOptions...)

    @property 'background-image',
      value: 'none'
      input: @select(imageOptions...)

    @property 'font-weight',
      value: 'normal'
      input: @select 'bold', 'normal'
  ]

  @rule 'h1', [
    @property 'padding',
      value: 15
      input: @range(15, 0, 50)

    @property 'margin',
      value: 15
      input: @range(15, 0, 50)

    @property 'color',
      value: 'magenta'
      input: @select(colorOptions...)

    @property 'font-weight',
      value: 'bold'
      input: @select 'bold', 'normal'
  ]

  @rule '#copyright', [
    @property 'color',
      value: '#CCCCCC'
      input: @select(colorOptions...)
  ]