{ pkgs, inputs, lib, config, ... }:

{

  imports = [
    ./caelestia/caelestia.nix
  ];

  home.packages = with pkgs; [
    playerctl
    wev
    satty
    hyprshot
  ];

  wayland.windowManager.hyprland = {

    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
      inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
    ];

    settings = {
      "$mod" = "SUPER";

      monitor = ",highres,auto,auto";

      "$terminal" = "kitty";
      "$browser" = "zen";
      "$editor" = "code";
      "$files" = "dolphin";

      general = {

        no_border_on_floating = true;

        gaps_in = 4;
        gaps_out = 3;
        float_gaps = 20;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg"; 
        "col.inactive_border" = "rgba(59595955) rgba(6e836855)";

        resize_on_border = true;
        hover_icon_on_border = true;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {

        rounding = 20;
        rounding_power = 4;

        active_opacity = 1.0;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1;

        dim_modal = true;
        dim_inactive = true;
        dim_strength = 0.07;

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          new_optimizations = true;
          noise = 0.0515;
        };

      };

      windowrulev2 =  [
        "float, title:^(Picture in picture)$"
        "pin, title:^(Picture in picture)$"
      ];

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        animation = [
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      input = {
        touchpad = {
          disable_while_typing = false;
          clickfinger_behavior = true;
        };
      };

      dwindle = {
          "pseudotile" = true; # Master switch for pseudotiling. Enabling is bound to mod + P in the keybinds section below
          "preserve_split" = true; # You probably want this
      };

      master = {
          "new_status" = "master";
      };

      misc = {
          "disable_hyprland_logo" = true; 
          "mouse_move_enables_dpms" = true;
          "key_press_enables_dpms" = true;
          "animate_manual_resizes" = true;
          "animate_mouse_windowdragging" = false;
          "enable_swallow" = true;
          "new_window_takes_over_fullscreen" = 1;
      };  

      binds = {
        "workspace_back_and_forth" = true;
        "hide_special_on_workspace_change" = true;
        "allow_pin_fullscreen" = true;
        "movefocus_cycles_fullscreen" = true;
      };

      bind = [
        "$mod, T, exec, $terminal"
        "$mod, B, exec, $browser"
        "$mod, E, exec, $files"
        "$mod, V, exec, $editor"

        "$mod alt, space, hyprexpo:expo, toggle"
        "$mod, space, global, caelestia:launcher"

        "$mod, l, global, caelestia:lock"
        "$mod shift, L, exit,"
        "$mod, Q, killactive,"
        "$mod, E, exec, $fileManager"
        "$mod, F, togglefloating,"
        "$mod, R, exec, $menu"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, M, fullscreen, 0"
        "$mod shift, M, fullscreen, 1"
        "$mod, N, pin"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, Tab, cyclenext,"
        "$mod shift, Tab, cyclenext, prev"


        "$mod shift, left, movewindow, l"
        "$mod shift, right, movewindow, r"
        "$mod shift, Up, movewindow, u"
        "$mod shift, down, movewindow, d"

        
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, a, exec, mkdir -p $HOME/Pictures/Screenshots/ && hyprshot -m output -z --raw | satty --filename - --output-filename $HOME/Pictures/Screenshots/screenshot_$(date +'%Y%m%d_%H%M%S').png --early-exit --corner-roundness 8  --no-window-decoration --fullscreen"
        "$mod shift, a, exec, mkdir -p $HOME/Pictures/Screenshots/ && hyprshot -m region -z --raw | satty --filename - --output-filename $HOME/Pictures/Screenshots/screenshot_$(date +'%Y%m%d_%H%M%S').png --early-exit --corner-roundness 8  --no-window-decoration --fullscreen"
        "$mod control, a, exec, mkdir -p $HOME/Pictures/Screenshots/ && hyprshot -m window -z --raw | satty --filename - --output-filename $HOME/Pictures/Screenshots/screenshot_$(date +'%Y%m%d_%H%M%S').png --early-exit --corner-roundness 8  --no-window-decoration --fullscreen"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      binde = [
        "$mod control, left, resizeactive, -10 0"
        "$mod control, right, resizeactive, 10 0"
        "$mod control, Up, resizeactive, 0 -10"
        "$mod control, down, resizeactive, 0 10"

        "$mod control alt, left, resizeactive, -30 0"
        "$mod control alt, right, resizeactive, 30 0"
        "$mod control alt, Up, resizeactive, 0 -30"
        "$mod control alt, down, resizeactive, 0 30"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod shift, mouse:272, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        # ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        # ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
       
      ]; 

      bindl = [
        "ctrl $mod, space, global, caelestia:mediaToggle"
        ", XF86AudioPlay, global, caelestia:mediaToggle"
        ", XF86AudioPause, global, caelestia:mediaToggle"
        "ctrl $mod, equal, global, caelestia:mediaNext"
        ", XF86AudioNext, global, caelestia:mediaNext"
        "ctrl $mod, minus, global, caelestia:mediaPrev"
        ", XF86AudioPrev, global, caelestia:mediaPrev"
        ", XF86AudioStop, global, caelestia:mediaStop"
        ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
        ", XF86MonBrightnessDown, global, caelestia:brightnessDown"
      ];

      exec = "hyprctl dispatch submap global";
      "submap" = "global";

      bindin = [
        "$mod, catchall, global, caelestia:launcherInterrupt"
        "$mod, mouse:272, global, caelestia:launcherInterrupt"
        "$mod, mouse:273, global, caelestia:launcherInterrupt"
        "$mod, mouse:274, global, caelestia:launcherInterrupt"
        "$mod, mouse:275, global, caelestia:launcherInterrupt"
        "$mod, mouse:276, global, caelestia:launcherInterrupt"
        "$mod, mouse:277, global, caelestia:launcherInterrupt"
        "$mod, mouse_up, global, caelestia:launcherInterrupt"
        "$mod, mouse_down, global, caelestia:launcherInterrupt"
      ];

      gesture = [
        "3, left, workspace, -1"
        "3, right, workspace, +1"
      ];

      env = [
        "NIXOS_OZONE_WL,1"
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          gesture_distance = 150;
        };

        dynamic-cursors = {
          enabled = true;
          mode = "rotate";
          threshold = 2;

          rotate = {

            length = 20;

            offset = 0.0;
          };

          shake = {

            enabled = true;

            nearest = true;

            threshold = 6.0;

            base = 4.0;
            speed = 12.0;
            influence = 24.0;

            limit = 0.0;

            timeout = 2000;

            effects = true;

          };

          hyprcursor = {

            nearest = true;

            enabled = true;

            resolution = -1;

            fallback = "clientside";
          };
        };
      };
    };
  };
}
