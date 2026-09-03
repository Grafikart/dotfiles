-- Port of keybindings.conf to the Hyprland Lua configuration API.
-- Reference: https://wiki.hypr.land/Configuring/Start/

local main_mod = "SUPER"

-- Action keys
hl.bind(main_mod .. " + Return", hl.dsp.exec_cmd('kitty -d "$(hypercwd)"'))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen_state({ internal = 3, client = 3 }))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd('thunar "Téléchargements"'))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd("rofi -show drun -config ~/.config/rofi/config.rasi"))
hl.bind(main_mod .. " + Z", hl.dsp.group.toggle())
hl.bind(main_mod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("~/.config/rofi/cliplist.sh"))
hl.bind(main_mod .. " + Tab", hl.dsp.group.next())
hl.bind(main_mod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(main_mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + SHIFT + Q", hl.dsp.window.close({}))
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("~/.config/hypr/toggle-waybar.sh"))
-- hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-- Media keys: `locked` preserves the former bindl behavior.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Move focus with mainMod + arrow keys
hl.bind(main_mod .. " + left", hl.dsp.exec_cmd("~/.config/hypr/focus.sh switch left"))
hl.bind(main_mod .. " + right", hl.dsp.exec_cmd("~/.config/hypr/focus.sh switch right"))
hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "down" }))
-- Move window
hl.bind(main_mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(main_mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(main_mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(main_mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down", group_aware = true }))

-- Switch workspaces with mainMod + [0-9]. The original configuration deliberately
-- uses physical keycodes (10–19), so preserve that behavior instead of switching
-- to layout-dependent digits.
for workspace = 1, 10 do
    local keycode = workspace + 9
    hl.bind(main_mod .. " + code:" .. keycode, hl.dsp.focus({ workspace = workspace }))
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    hl.bind(main_mod .. " + SHIFT + code:" .. keycode, hl.dsp.window.move({ workspace = workspace }))
end

-- Example special workspace (scratchpad)
hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
