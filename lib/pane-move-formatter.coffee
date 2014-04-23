module.exports =
  move: (index) ->
    # get current destroy settings
    destroy_empty_panes = atom.config.get 'core.destroyEmptyPanes'

    atom.config.set 'core.destroyEmptyPanes', false

    # get pane
    current_pane = atom.workspaceView.getActivePane()

    # target pane
    target_pane = @getTargetPane current_pane, index

    # do nothing if the panes are the same
    if target_pane? and current_pane isnt target_pane
      # get active item
      active_item = atom.workspace.getActivePaneItem()

      @moveItem active_item, current_pane, target_pane

    # reset destroy settings
    atom.config.set 'core.destroyEmptyPanes', destroy_empty_panes

  getTargetPane: (pane, index) ->
    panes = atom.workspaceView.getPanes()

    current_index = panes.indexOf pane

    target_index = current_index + index
    target_index = 0 if target_index < 0
    target_index = panes.length - 1 if target_index >= panes.length

    return panes[target_index]

  moveItem: (item, current_pane, target_pane) ->
    current_pane.moveItemToPane item, target_pane, target_pane.getItems().length

    target_pane.activateItem item

    target_pane.activate()
