{ inputs, pkgs, lib, config, ... }:

let
    currentUser = builtins.baseNameOf (toString ./.);
in
    
{ 
    users.users.${currentUser} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
    };

    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager.users.${currentUser} = {
        
        imports = [
            inputs.zen-browser.homeModules.beta
            ./zen.nix

            inputs.caelestia-shell.homeManagerModules.default
            ./hyprland/hyprland.nix

            (import ./zsh/zsh.nix { inherit pkgs currentUser; } ) 
        ];

        _module.args.inputs = inputs;

        home.packages = with pkgs; [
            kitty
            vscode
            bitwarden
            gh
        ];

        home.stateVersion = "25.05";
    };
}
