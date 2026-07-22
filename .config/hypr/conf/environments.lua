-- +----------------------------------------------------------+
-- |                       Environments                       |
-- +----------------------------------------------------------+
-- See https://wiki.hyprland.org/Configuring/Environment-variables

-- # XDG Desktop Portal
-- env = XDG_CURRENT_DESKTOP,Hyprland
-- env = XDG_SESSION_TYPE,wayland
-- env = XDG_SESSION_DESKTOP,Hyprland
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

--
-- # QT
-- env = QT_QPA_PLATFORM,wayland
-- env = QT_QPA_PLATFORMTHEME, qt5ct
-- env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
-- env = QT_AUTO_SCREEN_SCALE_FACTOR,1
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

--
-- # Toolkit Backend
-- env = GDK_BACKEND,wayland,x11,*
-- env = CLUTTER_BACKEND,wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

--
-- # Mozilla
-- env = MOZ_ENABLE_WAYLAND,1
hl.env("MOZ_ENABLE_WAYLAND", "1")

--
-- # Disable appimage launcher by default
-- env = APPIMAGELAUNCHER_DISABLE,1
hl.env("APPIMAGELAUNCHER_DISABLE", "1")

--
-- # NVIDIA https://wiki.hyprland.org/Nvidia/
-- env = LIBVA_DRIVER_NAME,nvidia
-- env = GBM_BACKEND,nvidia-drm
-- env = __GLX_VENDOR_LIBRARY_NAME,nvidia
-- env = __GL_VRR_ALLOWED,0
-- # env = WLR_DRM_NO_ATOMIC,1
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", "0")
-- hl.env("AQ_NO_ATOMIC", "1")

--
-- # GTK
-- env = GDK_SCALE,1
hl.env("GDK_SCALE", "1")

--
-- # Ozone
-- env = OZONE_PLATFORM,wayland
-- env = ELECTRON_OZONE_PLATFORM_HINT,auto
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

--
-- # Theme https://wiki.hyprland.org/Configuring/Environment-variables/#theming-related-variables
-- # Set the cursor size for xcursor
-- env = XCURSOR_THEME,Bibata-Modern-Classic
-- env = XCURSOR_SIZE,24
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
