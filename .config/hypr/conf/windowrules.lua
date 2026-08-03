-- +----------------------------------------------------------+
-- |                       Window Rules                       |
-- +----------------------------------------------------------+
--
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- # Workspaces
hl.window_rule({ name = "firefox-browser", match = { class = "firefox" }, workspace = 1 })
hl.window_rule({ name = "chromium-browser", match = { class = "Chromium" }, workspace = 1 })
hl.window_rule({ name = "discord", match = { class = "discord" }, workspace = 4 })
hl.window_rule({ name = "slack", match = { class = "Slack" }, workspace = 4 })
hl.window_rule({ name = "telegram", match = { class = "org.telegram.desktop" }, workspace = 4 })
hl.window_rule({ name = "steam", match = { class = "^([Ss]team)$" }, workspace = 5 })

-- Disable borders if only one window
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })

-- Jetbrains specific settings
hl.window_rule({
  match = { class = "^jetbrains-.*$", float = true, title = [[^$|^\s$|^win\d+$]] },
  no_initial_focus = true,
})

-- Floating
hl.window_rule({ match = { title = "^(About Mozilla Firefox)$" }, float = true })
hl.window_rule({ match = { class = "firefox", title = "^(Picture-in-Picture)$" }, float = true })
hl.window_rule({ match = { class = "firefox", title = "^(Library)$" }, float = true })
hl.window_rule({ match = { class = "^(nwg-look)$" }, float = true })
hl.window_rule({
  match = { class = "(.*org.pulseaudio.pavucontrol.*)" },
  float = true,
  center = true,
  size = { "monitor_w * 0.45", "monitor_h * 0.45" },
})
hl.window_rule({ match = { class = "^(nm-applet)$" }, float = true })
hl.window_rule({ match = { class = "blueberry.py" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "system-config-printer" }, float = true })
hl.window_rule({ match = { class = "org.telegram.desktop" }, float = true, center = true })
hl.window_rule({ match = { class = "org.gnome.SimpleScan" }, float = true })
hl.window_rule({ match = { class = "qalculate-gtk" }, float = true })
hl.window_rule({ match = { class = ".*.exe" }, float = true })
hl.window_rule({ match = { class = "^([Ss]team)$" }, float = true })
