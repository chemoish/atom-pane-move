paneMoveFormatter = require './pane-move-formatter'

module.exports =
  activate: ->
    atom.workspaceView.command 'pane-move:down', => @moveDown()
    atom.workspaceView.command 'pane-move:left', => @moveLeft()
    atom.workspaceView.command 'pane-move:right', => @moveRight()
    atom.workspaceView.command 'pane-move:up', => @moveUp()

  moveDown:  -> paneMoveFormatter.move 'vertical', +1
  moveLeft:  -> paneMoveFormatter.move 'horizontal', -1
  moveRight: -> paneMoveFormatter.move 'horizontal', +1
  moveUp:    -> paneMoveFormatter.move 'vertical', -1
