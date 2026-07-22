--  _     _           _
-- | |__ (_)_ __   __| |___
-- | '_ \| | '_ \ / _` / __|
-- | |_) | | | | | (_| \__ \
-- |_.__/|_|_| |_|\__,_|___/
--
-- See https://wiki.hyprland.org/Configuring/Binds

local mainMod = "SUPER"

-- +-----------------------------------------------------------+
-- |                       Applications                        |
-- +-----------------------------------------------------------+

-- # terminal
-- bind = $mainMod, RETURN, exec, $TERMINAL
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(os.getenv("TERMINAL")))

-- # Rofi
-- bind = $mainMod, p, exec, rofi -show drun
-- bind = $mainMod SHIFT, p, exec, rofi -show run
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("rofi -show run"))

-- # waybar
-- bind = $mainMod, b, exec, killall -SIGUSR1 waybar
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

-- # +-----------------------------------------------------------+
-- # |                          Display                          |
-- # +-----------------------------------------------------------+
--  # Increase display zoom
-- bind = $mainMod SHIFT, mouse_down, exec, hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}")
hl.bind(
  mainMod .. " + SHIFT + mouse_down",
  hl.dsp.exec_cmd(
    [[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}")]]
  )
)

-- # Decrease display zoom
-- bind = $mainMod SHIFT, mouse_up, exec, hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}")
hl.bind(
  mainMod .. " + SHIFT + mouse_up",
  hl.dsp.exec_cmd(
    [[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}")]]
  )
)

--  # Reset display zoom
-- bind = $mainMod SHIFT, z, exec, hyprctl keyword cursor:zoom_factor 1
hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- # +-----------------------------------------------------------+
-- # |                          Windows                          |
-- # +-----------------------------------------------------------+
-- bind = $mainMod, q, killactive            # Kill active window
-- bind = $mainMod, M, exit                  # Exit Hyprland
-- bind = $mainMod, f, fullscreen            # Toggle active windows into fullscreen
-- bind = $mainMod, o, togglefloating        # Toggle active windows into floating mode
-- bind = $mainMod, TAB, workspace, previous # Toggle back and forth between two recent workspaces
hl.bind(mainMod .. " + q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + o", hl.dsp.window.float())
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- # Move focus
-- bind = $mainMod, h, movefocus, l
-- bind = $mainMod, l, movefocus, r
-- bind = $mainMod, k, movefocus, u
-- bind = $mainMod, j, movefocus, d
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- # Swap the active window with another window
-- bind = $mainMod SHIFT, h, movewindow, l
-- bind = $mainMod SHIFT, l, movewindow, r
-- bind = $mainMod SHIFT, k, movewindow, u
-- bind = $mainMod SHIFT, J, movewindow, d
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- # Resizing the active window
-- bind = $mainMod SHIFT, right, resizeactive, 100 0
-- bind = $mainMod SHIFT, left, resizeactive, -100 0
-- bind = $mainMod SHIFT, down, resizeactive, 0 100
-- bind = $mainMod SHIFT, up, resizeactive, 0 -100
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))

-- # move / resize window with the mouse
-- bindm = $mainMod, mouse:272, movewindow
-- bindm = $mainMod, mouse:273, resizewindow
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- # +-----------------------------------------------------------+
-- # |                          Actions                          |
-- # +-----------------------------------------------------------+
-- # custom scripts
-- # bind = $mainMod, Q, sysact
-- # bind = ,HOME, dmenu-script-select
-- # bind = ,NEXT, microphone toggle
-- hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("sysact"))
-- hl.bind("HOME",             hl.dsp.exec_cmd("dmenu-script-select"))
-- hl.bind("NEXT",             hl.dsp.exec_cmd("microphone toggle"))

-- # +-----------------------------------------------------------+
-- # |                        Workspaces                         |
-- # +-----------------------------------------------------------+
-- # Switch workspaces with mainMod + [0-9]
-- bind = $mainMod, 1, workspace, 1
-- bind = $mainMod, 2, workspace, 2
-- bind = $mainMod, 3, workspace, 3
-- bind = $mainMod, 4, workspace, 4
-- bind = $mainMod, 5, workspace, 5
-- bind = $mainMod, 6, workspace, 6
-- bind = $mainMod, 7, workspace, 7
-- bind = $mainMod, 8, workspace, 8
-- bind = $mainMod, 9, workspace, 9
-- bind = $mainMod, 0, workspace, 10
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- # Move active window to a workspace with mainMod + SHIFT + [0-9]
-- bind = $mainMod SHIFT, 1, movetoworkspace, 1
-- bind = $mainMod SHIFT, 2, movetoworkspace, 2
-- bind = $mainMod SHIFT, 3, movetoworkspace, 3
-- bind = $mainMod SHIFT, 4, movetoworkspace, 4
-- bind = $mainMod SHIFT, 5, movetoworkspace, 5
-- bind = $mainMod SHIFT, 6, movetoworkspace, 6
-- bind = $mainMod SHIFT, 7, movetoworkspace, 7
-- bind = $mainMod SHIFT, 8, movetoworkspace, 8
-- bind = $mainMod SHIFT, 9, movetoworkspace, 9
-- bind = $mainMod SHIFT, 0, movetoworkspace, 10
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- # Scroll through existing workspaces with mainMod + scroll
-- bind = $mainMod, mouse_down, workspace, e+1
-- bind = $mainMod, mouse_up, workspace, e-1
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

--
-- # +-----------------------------------------------------------+
-- # |                          Fn Keys                          |
-- # +-----------------------------------------------------------+
-- # Audio Control
-- bind =  ,XF86AudioMute,        exec, audio volume-toggle
-- binde = ,XF86AudioRaiseVolume, exec, audio volume-up
-- binde = ,XF86AudioLowerVolume, exec, audio volume-down
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("audio volume-toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("audio volume-up"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("audio volume-down"), { repeating = true })

-- # Brightness Control
-- binde = ,XF86MonBrightnessUp,   exec, brightness up
-- binde = ,XF86MonBrightnessDown, exec, brightness down
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightness up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightness down"), { repeating = true })

-- # Screen recording
-- # bind = ,XF86Search, exec, screenshot-area
-- hl.bind("XF86Search", hl.dsp.exec_cmd("screenshot-area"))
