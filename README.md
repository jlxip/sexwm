# sexwm
Simple and efficient X11 window manager

## Why?
Everyone starts in Ubuntu with Gnome. Then, you realize you can greatly improve your productivity with more advanced window managers such as the listed above. You start to configure them so they fit your workflow. At some point, some of us start to realize that our WM has way more features than we need, as well as some that are missing. The only way to have a WM that completely and _exclusively_ follows your workflow is to make it yourself.

## What's it about?
`sexwm` is a window manager. It manages how the windows are organized on the screen. There are a whole lot of these (`i3`, `bspwm`, `dwm`, `awesome`...). Specifically, it's a floating WM. Windows float around every part of the screen, have arbitrary dimensions, and stack on top of each other. Most of the ideas `sexwm` uses come form different already existing WMs:

- `bspwm`, by @baskerville, has great modularity. The WM itself does only exactly what it needs to do, it doesn't even control the hotkeys. This last part is done by a different program, `sxhkd`. This is great design, so `sexwm` takes it. This way, `sexwm` needs `sxhkd` (or equivalent) to work. Otherwise, it's just a black screen. The only hotkey `sexwm` has hardcoded is the key to move and resize windows: `Super + left click` moves, `Super + right click` resizes.
- `bspwm`, again, has an outstanding configuration paradigm. There is no configuration file, no syntax to learn. There's only a shell script that dynamically tells `bspwm` how it should behave (kind of like bash). This way, you can temporally alter the configuration on the fly, and only make it permanent if you wish to do so. This paradigm makes both the configuration by the user easier (no weird syntax to memorize), as well as the code (no parsing is necessary).
- `cwm`, by @mariusae, introduces the concept of _window groups_. They substitute multiple desktops in what I think is a beautiful way that also fits my workflow. Kind of like with multiple desktops in tiling WMs, each window group focuses on one task: for instance, virtual machines, which would contain the `virt-manager` program as well as each Spice monitor. You can then stack multiple window groups on top of each other, showing and hiding them at will, without losing visibility of what's on the background.
- Unlike `cwm`, and following the line of `bspwm`, a WM should never have to tell you anything. It should be transparent and show no messages to the user: if it does, it will display the information in an ugly way.

A window in `sexwm` can be in one of the following states:
- Floating. It can move and resize around the screen. The file manager could usually be in this state.
- Monocle. Maximized and always on background. I usually run Firefox and Spotify this way.
- Full screen. Fully maximized (overriding the bar if there's one present), and always on top. You probably want VLC running in this state.

`sexc` is the `sexwm` configurator. It just sends signals to the `sexwm` process. For instance, the change of state (invoked by the hotkey monitor) is as simple as:

```
sexc win -s monocle
```

The `sexwm` start-up script (`~/.config/sexwm`) can set which mode a window has by default before it's opened.

**TODO:** Explain how this works.