paneMoveFormatter = require './pane-move-formatter'

module.exports =
  activate: ->
    atom.commands.add 'atom-text-editor',
      'pane-move:down': => @moveDown()
      'pane-move:left': => @moveLeft()
      'pane-move:right': => @moveRight()
      'pane-move:up': => @moveUp()

  moveDown:  -> paneMoveFormatter.move +1
  moveLeft:  -> paneMoveFormatter.move -1
  moveRight: -> paneMoveFormatter.move +1
  moveUp:    -> paneMoveFormatter.move -1
