module.exports =
  getPaneByOffset: (pane, offset) ->
    panes = atom.workspace.getCenter().getPanes()

    current_index = panes.indexOf pane

    target_index = current_index + offset

    # enable tab cycling
    if target_index < 0
      target_index = panes.length - 1 # last pane
    else if target_index >= panes.length
      target_index = 0 # first pane

    return panes[target_index]

  move: (offset) ->
    # get current destroy settings
    destroy_empty_panes = atom.config.get 'core.destroyEmptyPanes'

    atom.config.set 'core.destroyEmptyPanes', false

    # get pane
    current_pane = atom.workspace.getActivePane()

    # target pane
    target_pane = @getPaneByOffset current_pane, offset

    # do nothing if the panes are the same
    if target_pane? and current_pane isnt target_pane
      # get active item
      active_item = atom.workspace.getActivePaneItem()

      @moveItem active_item, current_pane, target_pane

    # reset destroy settings
    atom.config.set 'core.destroyEmptyPanes', destroy_empty_panes

  moveItem: (item, current_pane, target_pane) ->
    current_pane.moveItemToPane item, target_pane, target_pane.getItems().length

    target_pane.activateItem item

    target_pane.activate()

  moveTo: (column) ->
    # get current destroy settings
    destroy_empty_panes = atom.config.get 'core.destroyEmptyPanes'

    atom.config.set 'core.destroyEmptyPanes', false

    # get pane
    current_pane = atom.workspace.getActivePane()

    # target pane
    target_pane = atom.workspace.getCenter().getPanes()[column - 1]

    # do nothing if the panes are the same
    if target_pane? and current_pane isnt target_pane
      # get active item
      active_item = atom.workspace.getActivePaneItem()

      @moveItem active_item, current_pane, target_pane

    # reset destroy settings
    atom.config.set 'core.destroyEmptyPanes', destroy_empty_panes
