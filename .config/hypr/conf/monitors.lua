-- # +----------------------------------------------------------+
-- # |                      Monitors                            |
-- # +----------------------------------------------------------+
--
-- # See https://wiki.hyprland.org/Configuring/Monitors

-- # monitor=,preferred,auto,1
-- # monitor=,1920x1080,auto,1
-- # monitor = HDMI-A-2, 1920x1080@60, 0x0, 1

-- hl.monitor({ output = "",        mode = "preferred",    position = "auto", scale = 1 })
-- hl.monitor({ output = "",        mode = "1920x1080",    position = "auto", scale = 1 })
-- hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@60", position = "0x0",   scale = 1 })

-- monitor = eDP-1, 1920x1080@60, 0x0, 1
-- # monitor = eDP-1, disable
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
-- hl.monitor({ output = "eDP-1", disabled = true })
--

-- monitor = HDMI-A-2, 2560x1440@60, 1920x0, 1
-- # monitor = HDMI-A-2, 1920x1080@120, 1920x0, 1
hl.monitor({ output = "HDMI-A-2", mode = "2560x1440@60", position = "1920x0", scale = 1 })
-- hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@120", position = "1920x0", scale = 1 })
