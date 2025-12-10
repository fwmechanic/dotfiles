local wezterm = require 'wezterm'
local act = wezterm.action

return {
  enable_kitty_keyboard = true,  -- let apps opt-in to KKP=Kitty Keyboard Protocol encoding
  mouse_wheel_scrolls_tabs = false,

  disable_default_key_bindings = true,
  --[[ works but unnecessary now that mouse select/paste is working
  keys = {
    {key="C", mods="CTRL|SHIFT", action=act.CopyTo("Clipboard")},
    {key="V", mods="CTRL|SHIFT", action=act.PasteFrom("Clipboard")},
    {key="Insert", mods="CTRL", action=act.CopyTo("PrimarySelection")},
    {key="Insert", mods="SHIFT", action=act.PasteFrom("PrimarySelection")},
    {key="X", mods="CTRL|SHIFT", action=act.ActivateCopyMode}, -- optional
  },
  ]]

  disable_default_mouse_bindings = true,
  mouse_bindings = {

    -- Use the event's real wheel delta (smooth & hi-res wheels)
    { event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'NONE',
      action = act.ScrollByCurrentEventWheelDelta,
      alt_screen = false },  -- only affect scrollback

    { event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'NONE',
      action = act.ScrollByCurrentEventWheelDelta,
      alt_screen = false },


    -- Normal selection -> copy both clipboards on mouse release
    { event = { Down = { streak = 1, button = 'Left' }}, mods = 'NONE', action = act.SelectTextAtMouseCursor 'Cell' },
    { event = { Drag = { streak = 1, button = 'Left' }}, mods = 'NONE', action = act.ExtendSelectionToMouseCursor 'Cell' },
    { event = { Up   = { streak = 1, button = 'Left' }}, mods = 'NONE', action = act.CompleteSelection 'ClipboardAndPrimarySelection' },

    -- Optional: block (rectangular) select with Alt
    { event = { Down = { streak = 1, button = 'Left' }}, mods = 'ALT', action = act.SelectTextAtMouseCursor 'Block' },
    { event = { Drag = { streak = 1, button = 'Left' }}, mods = 'ALT', action = act.ExtendSelectionToMouseCursor 'Block' },
    { event = { Up   = { streak = 1, button = 'Left' }}, mods = 'ALT', action = act.CompleteSelection 'ClipboardAndPrimarySelection' },

    -- Double-click = select word
    { event = { Down = { streak = 2, button = 'Left' }}, mods = 'NONE', action = act.SelectTextAtMouseCursor 'Word' },
    { event = { Drag = { streak = 2, button = 'Left' }}, mods = 'NONE', action = act.ExtendSelectionToMouseCursor 'Word' },
    { event = { Up   = { streak = 2, button = 'Left' }}, mods = 'NONE', action = act.CompleteSelection 'ClipboardAndPrimarySelection' },

    -- Triple-click = select line   (alt: use 'SemanticZone' if you prefer)
    { event = { Down = { streak = 3, button = 'Left' }}, mods = 'NONE', action = act.SelectTextAtMouseCursor 'Line' },         -- or 'SemanticZone'
    { event = { Drag = { streak = 3, button = 'Left' }}, mods = 'NONE', action = act.ExtendSelectionToMouseCursor 'Line' },    -- or 'SemanticZone'
    { event = { Up   = { streak = 3, button = 'Left' }}, mods = 'NONE', action = act.CompleteSelection 'ClipboardAndPrimarySelection' },

    -- right click paste
    { event = { Down = { streak = 1, button = 'Right' }}, mods = 'NONE', action = act.PasteFrom 'Clipboard' },
    -- Middle-click paste from PRIMARY (X11/Wayland)
    { event = { Down = { streak = 1, button = 'Middle' }}, mods = 'NONE', action = act.PasteFrom 'PrimarySelection' },

    -- Click to open hyperlinks
    { event = { Up = { streak = 1, button = 'Left' }}, mods = 'CTRL', action = act.OpenLinkAtMouseCursor, mouse_reporting = true },
  }
}
