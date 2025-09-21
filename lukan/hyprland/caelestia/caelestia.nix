{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libnotify
  ];

  programs.caelestia = {
    enable = true;
   
    settings = {

      appearance.transparency = {
        enabled = true;
        base = 0.9;
        layers = 0.4;
      };

      general = {
        apps = {
          terminal = [ "kitty" ];
        };
        idle = {
          inhibitWhenAudio = true;
          lockTimeout = 180;
          dpmsTimeout = 300;
          sleepTimeout = 600;
        };
      };

      background = {
        desktopClock = {
          enabled = true;
        };
        enabled = true;
        visualiser = {
          enabled = true;
          autoHide = true;
          rounding = 1;
          spacing = 1;
        };
      };

      bar = {
        entries = [
          { id = "logo"; enabled = false; }
          { id = "workspaces"; enabled = true; }
          { id = "spacer"; enabled = true; }
          { id = "activeWindow"; enabled = true; }
          { id = "spacer"; enabled = false; }
          { id = "tray"; enabled = true; }
          { id = "clock"; enabled = true; }
          { id = "statusIcons"; enabled = true; }
          { id = "power"; enabled = true; }
        ];
        persistent = false;
        scrollActions = {
          brightness = true;
          workspaces = true;
          volume = true;
        };
        showOnHover = true;
        status = {
          showAudio = false;
          showBattery = true;
          showBluetooth = true;
          showKbLayout = false;
          showMicrophone = false;
          showNetwork = true;
          showLockStatus = true;
        };
        tray = {
          background = false;
          iconSubs = [];
          recolour = false;
        };
        workspaces = {
          activeIndicator = true;
          activeLabel = "󰮯";
          activeTrail = true;
          label = "  ";
          occupiedBg = false;
          occupiedLabel = "󰮯";
          perMonitorWorkspaces = true;
          showWindows = true;
          shown = 5;
        };

        sizes = {
          innerWidth = 30;
        };
      };
      
      launcher = {
        enabled = true;
        actionPrefix = "/";
        actions = [
          {
            name = "Calculator";
            icon = "calculate";
            description = "Do simple math equations (powered by Qalc)";
            command = [ "autocomplete" "calc" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Scheme";
            icon = "palette";
            description = "Change the current colour scheme";
            command = [ "autocomplete" "scheme" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Wallpaper";
            icon = "image";
            description = "Change the current wallpaper";
            command = [ "autocomplete" "wallpaper" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Variant";
            icon = "colors";
            description = "Change the current scheme variant";
            command = [ "autocomplete" "variant" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Transparency";
            icon = "opacity";
            description = "Change shell transparency";
            command = [ "autocomplete" "transparency" ];
            enabled = false;
            dangerous = false;
          }
          {
            name = "Random";
            icon = "casino";
            description = "Switch to a random wallpaper";
            command = [ "caelestia" "wallpaper" "-r" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Light";
            icon = "light_mode";
            description = "Change the scheme to light mode";
            command = [ "setMode" "light" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Dark";
            icon = "dark_mode";
            description = "Change the scheme to dark mode";
            command = [ "setMode" "dark" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Shutdown";
            icon = "power_settings_new";
            description = "Shutdown the system";
            command = [ "systemctl" "poweroff" ];
            enabled = true;
            dangerous = true;
          }
          {
            name = "Reboot";
            icon = "cached";
            description = "Reboot the system";
            command = [ "systemctl" "reboot" ];
            enabled = true;
            dangerous = true;
          }
          {
            name = "Logout";
            icon = "exit_to_app";
            description = "Log out of the current session";
            command = [ "loginctl" "terminate-user" "" ];
            enabled = true;
            dangerous = true;
          }
          {
            name = "Lock";
            icon = "lock";
            description = "Lock the current session";
            command = [ "loginctl" "lock-session" ];
            enabled = true;
            dangerous = false;
          }
          {
            name = "Sleep";
            icon = "bedtime";
            description = "Suspend then hibernate";
            command = [ "systemctl" "suspend-then-hibernate" ];
            enabled = true;
            dangerous = false;
          }
        ];
        dragThreshold = 50;
        vimKeybinds = false;
        enableDangerousActions = true;
        maxShown = 7;
        maxWallpapers = 9;
        specialPrefix = "@";
        useFuzzy = {
          apps = true;
          actions = true;
          schemes = true;
          variants = true;
          wallpapers = true;
        };
        autoHide = true;
        showOnHover = false;
        hiddenApps = [];
      };

      lock = {
        recolourLogo = false;
      };

      notifs = {
        expire = true;
        actionOnClick = true;
        clearThreshold = 0.3;
        defaultExpireTimeout = 5000;
        expandThreshold = 20;
      };

      osd = {
        enabled = true;
        enableBrightness = true;
        enableMicrophone = false;
        hideDelay = 2000;
      };

      paths = {
        mediaGif = "root:/assets/bongocat.gif";
        sessionGif = "root:/assets/kurukuru.gif";
        wallpaperDir = "/etc/nixos/lukan/hyprland/caelestia/wallpapers";
      };

      services = {
        audioIncrement = 0.1;
        defaultPlayer = "Spotify";
        gpuType = "";
        playerAliases = [
          { from = "com.github.th_ch.youtube_music"; to = "YT Music"; }
        ];
        weatherLocation = "";
        useFahrenheit = false;
        useTwelveHourClock = false;
        smartScheme = true;
        visualiserBars = 45;
      };

      session = {
        dragThreshold = 30;
        vimKeybinds = false;
        commands = {
          logout = [ "loginctl" "terminate-user" "" ];
          shutdown = [ "systemctl" "poweroff" ];
          hibernate = [ "systemctl" "hibernate" ];
          reboot = [ "systemctl" "reboot" ];
        };
      };

      utilities = {
        enabled = true;
      };

    };
  };
}