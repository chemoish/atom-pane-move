paneMoveFormatter = require './pane-move-formatter'

module.exports =
  activate: ->
    atom.workspaceView.command 'pane-move:down', => @moveDown()
    atom.workspaceView.command 'pane-move:left', => @moveLeft()
    atom.workspaceView.command 'pane-move:right', => @moveRight()
    atom.workspaceView.command 'pane-move:up', => @moveUp()

  moveDown:  -> paneMoveFormatter.move +1
  moveLeft:  -> paneMoveFormatter.move -1
  moveRight: -> paneMoveFormatter.move +1
  moveUp:    -> paneMoveFormatter.move -1
