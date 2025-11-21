{ lib, pkgs, ... }: {
  imports = [ ./kitty.nix ];

  programs.zsh = {
    enable = true;
    initContent = let
      p10kfile = ./.p10k.zsh;
      zshBeforeCompInit = lib.mkOrder 550 ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
        setopt notify interactive_comments
        unsetopt autocd beep extendedglob nomatch
        set -o vi
      '';
      zshLastToRun = lib.mkOrder 1500 "source ${p10kfile}";
    in
      lib.mkMerge [ zshBeforeCompInit zshLastToRun ];

    shellAliases = {
      sw = "nh os switch";
      upd = "nh os switch --update";

      cat = "bat";
      dnd = "makoctl mode -t do-not-disturb";
      ff = "fastfetch";
      icat = "kitten icat";
      pcat = "bat -p";
      tree = "lsd --tree --icon never";
      v = "vim";

      ".." = "cd ..";
    };

    sessionVariables = {
      EDITOR = "vim";
    };

    plugins = [
      {                                                                                   
        name = "powerlevel10k";                                                           
        src = pkgs.zsh-powerlevel10k;                                                     
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];
  };
  
  home.shell.enableZshIntegration = true;
  programs.kitty.shellIntegration.enableZshIntegration = true;
  programs.lsd.enableZshIntegration = true;
  services.gpg-agent.enableZshIntegration = true;
}
