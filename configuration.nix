{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./lukan/lukan.nix
    ./sddm/sddm.nix
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "luphaestus";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";


  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    hyprland.enable = true;
    localsend = {
      enable = true;
      openFirewall = true;
    };
    zsh.enable = true;
    nm-applet.enable = true;
  };

  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    nano
    wget
    git
  ];

  services = {
    printing.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    thermald.enable = true;
    power-profiles-daemon.enable = true;
    upower = {
      enable = true;
      percentageLow = 15;
      percentageCritical = 5;
      percentageAction = 4;
      criticalPowerAction = "Hibernate";
    };
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];
  fonts.enableDefaultPackages = false;
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Mononoki Nerd Font Mono" ];
      sansSerif = [ "Mononoki Nerd Font" ];
      serif = [ "Mononoki Nerd Font" ];
    };
  };
  
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";

  system.stateVersion = "25.05";
}
