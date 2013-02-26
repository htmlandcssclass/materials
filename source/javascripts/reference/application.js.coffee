$ ->
  displayEl = $('p');

  makePropertyControl = (property, options) ->
    new PropertyControl property, $("##{property}-control"), displayEl, options

  # layout
  makePropertyControl 'display',
    initialValue: 'block',
    disabledValue: 'block'
  makePropertyControl 'position',
    initialValue: 'static',
    disabledValue: 'static'
  makePropertyControl 'width',
    initialValue: 400
  makePropertyControl 'height',
    initialValue: 200
  makePropertyControl 'top',
    initialValue: 0
  makePropertyControl 'left',
    initialValue: 0
  makePropertyControl 'padding',
    initialValue: 15,
    disabledValue: 0
  makePropertyControl 'margin',
    initialValue: 15,
    disabledValue: 0

  # decoration
  makePropertyControl 'border',
    initialValue: '1px solid #ccc',
    disabledValue: 'none'
  makePropertyControl 'background-color',
    initialValue: '#eee',
    disabledValue: 'transparent'

  # typography
  makePropertyControl 'text-decoration',
    initialValue: 'none',
    disabledValue: 'none'
  makePropertyControl 'font-weight',
    initialValue: 'bold',
    disabledValue: 'normal'
  makePropertyControl 'line-height',
    initialValue: 16
