{WorkspaceView} = require 'atom'

PaneMove = require '../lib/pane-move'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "PaneMove:", ->
  beforeEach ->
    waitsForPromise ->
      atom.workspaceView = new WorkspaceView
      atom.workspaceView.openSync()

      atom.workspaceView.open 'foo.txt'
      atom.workspaceView.open 'bar.txt'

  it 'should allow panes to be moved right in a multicolumn layout', ->
    panes = atom.workspaceView.getPanes()

    panes[0].splitRight()
    panes[0].activate()

    expect(panes[0].getItems().length).toBe 3
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    panes = atom.workspaceView.getPanes()

    PaneMove.moveRight()

    panes[1].activate()

    expect(panes[0].getItems().length).toBe 2
    expect(panes[1].getItems().length).toBe 1
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

  it 'should allow panes to be moved left in a multicolumn layout', ->
    panes = atom.workspaceView.getPanes()

    panes[0].splitLeft()
    panes[0].activate()

    expect(panes[0].getItems().length).toBe 3
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    panes = atom.workspaceView.getPanes()

    PaneMove.moveLeft()

    panes[0].activate()

    expect(panes[0].getItems().length).toBe 1
    expect(panes[1].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

  it 'should not allow panes to be moved left when it is the first pane', ->
    panes = atom.workspaceView.getPanes()

    panes[0].splitRight()
    panes[0].activate()

    expect(panes[0].getItems().length).toBe 3
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    panes = atom.workspaceView.getPanes()

    PaneMove.moveRight()
    PaneMove.moveRight()

    panes[1].activate()

    expect(panes[0].getItems().length).toBe 2
    expect(panes[1].getItems().length).toBe 1
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

  it 'should not allow panes to be moved right when it is the last pane', ->
    panes = atom.workspaceView.getPanes()

    panes[0].splitLeft()
    panes[0].activate()

    expect(panes[0].getItems().length).toBe 3
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    panes = atom.workspaceView.getPanes()

    PaneMove.moveLeft()
    PaneMove.moveLeft()

    panes[0].activate()

    expect(panes[0].getItems().length).toBe 1
    expect(panes[1].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'
