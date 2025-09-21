{ pkgs, inputs, ... }: let

  zero-bg = pkgs.fetchurl {
      url = "https://www.desktophut.com/files/kV1sBGwNvy-Wallpaperghgh2Prob4.mp4";
      hash = "sha256-VkOAkmFrK9L00+CeYR7BKyij/R1b/WhWuYf0nWjsIkM=";
    };

  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "default";  

    
    theme-overrides = {
      # "LockScreen" = {
      #                 background = "${zero-bg.name}";
      #   # background = "/etc/nixos/sddm/wallpapers/midnight-glow-over-peaks.1920x1080.mp4";
      # };
    }; 
  };

  in  {

  environment.systemPackages = [sddm-theme];
  qt.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm; 
    enable = true;
    theme = sddm-theme.pname;
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };
}