-- +----------------------------------------------------------+
-- |                       Window Rules                       |
-- +----------------------------------------------------------+
--
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- # Workspaces
-- windowrule = match:class firefox, workspace 1
-- windowrule = match:class ^(Chromium)$, workspace 1
-- windowrule = match:class ^(discord)$, workspace 4
-- windowrule = match:class ^(Slack)$, workspace 4
-- windowrule = match:class org.telegram.desktop, workspace 4
-- windowrule = match:class ^([Ss]team)$, workspace 5
hl.window_rule({ name = "firefox-browser", match = { class = "firefox" }, workspace = 1 })
hl.window_rule({ name = "chromium-browser", match = { class = "Chromium" }, workspace = 1 })
hl.window_rule({ name = "discord", match = { class = "discord" }, workspace = 4 })
hl.window_rule({ name = "slack", match = { class = "Slack" }, workspace = 4 })
hl.window_rule({ name = "telegram", match = { class = "org.telegram.desktop" }, workspace = 4 })
hl.window_rule({ name = "steam", match = { class = "^([Ss]team)$" }, workspace = 5 })

--
-- # Disable borders if only one window
-- windowrule = border_size 0, match:float 0, match:workspace w[tv1]
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })

--
-- # Jetbrains specific settings
-- windowrule = match:class ^jetbrains-.*$, match:float 1, match:title ^$|^\s$|^win\d+$, no_initial_focus on
hl.window_rule({
  match = { class = "^jetbrains-.*$", float = true, title = [[^$|^\s$|^win\d+$]] },
  no_initial_focus = true,
})

--
-- # Floating
-- windowrule = match:title ^(About Mozilla Firefox)$, float on
-- windowrule = match:class firefox, match:title ^(Picture-in-Picture)$, float on
-- windowrule = match:class firefox, match:title ^(Library)$, float on
-- windowrule = match:class ^(nwg-look)$, float on
-- windowrule = match:class (.*org.pulseaudio.pavucontrol.*), float on, center on, size (monitor_w*.45) (monitor_h*.45)
-- windowrule = match:class ^(nm-applet)$, float on
-- windowrule = match:class ^(blueberry.py)$, float on
-- windowrule = match:class ^(nm-connection-editor)$, float on
-- windowrule = match:class ^(system-config-printer)$, float on
-- windowrule = match:class ^(org.telegram.desktop)$, float on, center on
-- windowrule = match:class ^(org.gnome.SimpleScan)$, float on
-- windowrule = match:class ^(qalculate-gtk)$, float on
-- windowrule = match:class .*.exe, float on
-- windowrule = match:class ^([Ss]team)$, float on
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
