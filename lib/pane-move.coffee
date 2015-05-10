paneMoveFormatter = require './pane-move-formatter'

module.exports =
  activate: ->
    atom.commands.add 'atom-text-editor',
      'pane-move:down': => @moveDown()
      'pane-move:left': => @moveLeft()
      'pane-move:right': => @moveRight()
      'pane-move:up': => @moveUp()

      'pane-move-to:1': => @moveTo 1
      'pane-move-to:2': => @moveTo 2
      'pane-move-to:3': => @moveTo 3
      'pane-move-to:4': => @moveTo 4

  moveDown:  -> paneMoveFormatter.move +1
  moveLeft:  -> paneMoveFormatter.move -1
  moveRight: -> paneMoveFormatter.move +1
  moveUp:    -> paneMoveFormatter.move -1

  moveTo: (column) -> paneMoveFormatter.moveTo column
