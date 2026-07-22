-- +----------------------------------------------------------+
-- |                        Autostart                         |
-- +----------------------------------------------------------+
--
-- See: https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  -- clipboard manager
  hl.exec_cmd("cb")
  -- notification daemon
  hl.exec_cmd("dunst")
  -- hyprland's idle daemon
  hl.exec_cmd("hypridle")
  -- battery notifier
  hl.exec_cmd("batsignal")
  -- bar
  hl.exec_cmd("waybar")
  -- system tray network manager
  hl.exec_cmd("nm-applet --indicator")
  -- Setup XDG (for screen sharing)
  hl.exec_cmd("xdg-desktop-portal-hyprland")
  -- set desktop wallpaper
  hl.exec_cmd("setbg")
end)
