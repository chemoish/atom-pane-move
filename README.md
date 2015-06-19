# Atom.io – Pane Move Package

Move files through each pane or to a targeted pane.

## Features

| Command | Mac | PC and Linux |
| --- | --- | --- |
| Move files left | Cmd + Alt + Ctrl + ← | Alt + Shift + Ctrl + ← |
| Move files right | Cmd + Alt + Ctrl + → | Alt + Shift + Ctrl + → |
|	Move files to target pane | Ctrl + Shift + [1-4] | Same |

## Demo
![pane-layout](https://raw.github.com/chemoish/atom-pane-move/master/demo.gif)

## Nitty Gritty

 - Allows you to move files through each pane, but stops you once you reached the first or last pane.
 - Temporarily disables `core.destroyEmptyPanes` so empty panes do not collapse on themselves when your moving files around.
 - Works well with https://github.com/chemoish/atom-pane-layout
