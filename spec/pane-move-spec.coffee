PaneMove = require '../lib/pane-move'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "PaneMove:", ->
  beforeEach ->
    waitsForPromise ->
      atom.workspace.open 'foo.txt'
      atom.workspace.open 'bar.txt'

  it 'should allow panes to be moved right in a multicolumn layout', ->
    panes = atom.workspace.getPanes()

    panes[0].splitRight()
    panes[0].activate()

    panes = atom.workspace.getPanes()

    expect(panes[0].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    PaneMove.moveRight()

    panes[1].activate()

    expect(panes[0].getItems().length).toBe 1
    expect(panes[1].getItems().length).toBe 1
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    panes[0].activate()

    PaneMove.moveRight();

    expect(panes[1].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'foo.txt'

  it 'should allow panes to be moved left in a multicolumn layout', ->
    panes = atom.workspace.getPanes()

    panes[0].splitLeft()
    panes[0].activate()

    panes = atom.workspace.getPanes()

    expect(panes[1].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    PaneMove.moveLeft()

    panes[0].activate()

    expect(panes[0].getItems().length).toBe 1
    expect(panes[1].getItems().length).toBe 1
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    panes[1].activate()

    PaneMove.moveLeft();

    expect(panes[0].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'foo.txt'

  it 'should not allow panes to be moved left when it is the first pane', ->
    panes = atom.workspace.getPanes()

    panes[0].splitRight()
    panes[0].activate()

    panes = atom.workspace.getPanes()

    expect(panes[0].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    PaneMove.moveRight()
    PaneMove.moveRight()

    panes[1].activate()

    expect(panes[0].getItems().length).toBe 1
    expect(panes[1].getItems().length).toBe 1
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

  it 'should not allow panes to be moved right when it is the last pane', ->
    panes = atom.workspace.getPanes()

    panes[0].splitLeft()
    panes[0].activate()

    panes = atom.workspace.getPanes()

    expect(panes[1].getItems().length).toBe 2
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'

    PaneMove.moveLeft()
    PaneMove.moveLeft()

    panes[0].activate()

    expect(panes[0].getItems().length).toBe 1
    expect(panes[1].getItems().length).toBe 1
    expect(atom.workspace.getActivePaneItem().getTitle()).toBe 'bar.txt'
