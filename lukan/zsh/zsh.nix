{ pkgs, currentUser, ... }:

{

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch && git -C /etc/nixos add /etc/nixos && git -C /etc/nixos commit -m 'nixos-rebuild switch' && git -C /etc/nixos push";
        reload = "exec zsh";
        c = "clear";
        h = "history";
        j = "jobs -l";
        cd = "mycd() { z \"$@\" && ls; }; mycd";
        ci = "zi";
      };

      initContent = ''
        source ~/.p10k.zsh
      '';

      zplug = {
        enable = true;
        plugins = [
          { name = "chrissicool/zsh-256color"; } 
          { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
          { name = "akash329d/zsh-alias-finder"; }
          { name = "Skylor-Tang/auto-venv"; tags = [ use:auto-venv.zsh from:github at:main ]; }
          { name = "ael-code/zsh-colored-man-pages"; }
          { name = "zpm-zsh/colorize"; }
          { name = "ChrisPenner/copy-pasta"; }
          { name = "tolkonepiu/vscode-shell-integration-zsh-plugin"; }
          { name = "fdw/yazi-zoxide-zsh"; }

        ];
      };

      history.size = 10000;
    };

    fzf.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    yazi.enable = true;

  };

  home.file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;

}