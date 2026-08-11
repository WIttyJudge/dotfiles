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

-- open terminal
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(os.getenv("TERMINAL")))

-- Rofi
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("rofi -show run"))

-- toggle waybar
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

-- +-----------------------------------------------------------+
-- |                          Display                          |
-- +-----------------------------------------------------------+

-- Increase display zoom
hl.bind(
  mainMod .. " + SHIFT + mouse_down",
  hl.dsp.exec_cmd(
    "hyprctl eval \"hl.config({ cursor = { zoom_factor = $(hyprctl getoption cursor:zoom_factor | awk '/float:/ {print $2 + 0.5}') } })\""
  )
)

-- Decrease display zoom
hl.bind(
  mainMod .. " + SHIFT + mouse_up",
  hl.dsp.exec_cmd(
    "hyprctl eval \"hl.config({ cursor = { zoom_factor = $(hyprctl getoption cursor:zoom_factor | awk '/float:/ {val = $2 - 0.5; print (val < 1.0 ? 1.0 : val)}') } })\""
  )
)

-- Reset display zoom
hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- +-----------------------------------------------------------+
-- |                          Windows                          |
-- +-----------------------------------------------------------+

hl.bind(mainMod .. " + q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + o", hl.dsp.window.float())
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Swap the active window with another window
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Resizing the active window
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))

-- move / resize window with the mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- +-----------------------------------------------------------+
-- |                        Workspaces                         |
-- +-----------------------------------------------------------+

-- Switch workspaces with mainMod + [0-9]
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

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
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

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- +-----------------------------------------------------------+
-- |                          Fn Keys                          |
-- +-----------------------------------------------------------+

-- Audio Control
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("audio volume-toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("audio volume-up"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("audio volume-down"), { repeating = true })

-- Brightness Control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightness up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightness down"), { repeating = true })
