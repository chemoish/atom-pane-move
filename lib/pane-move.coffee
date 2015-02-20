paneMoveFormatter = require './pane-move-formatter'

module.exports =
  activate: ->
    atom.commands.add 'atom-text-editor',
      'pane-move:down': => @moveDown()

    atom.commands.add 'atom-text-editor',
      'pane-move:left': => @moveLeft()

    atom.commands.add 'atom-text-editor',
      'pane-move:right': => @moveRight()

    atom.commands.add 'atom-text-editor',
      'pane-move:up': => @moveUp()

  moveDown:  -> paneMoveFormatter.move +1
  moveLeft:  -> paneMoveFormatter.move -1
  moveRight: -> paneMoveFormatter.move +1
  moveUp:    -> paneMoveFormatter.move -1
