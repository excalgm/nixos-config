{ lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    initContent = let
      zshBeforeCompInit = lib.mkOrder 550 ''
        setopt notify interactive_comments
        unsetopt autocd beep extendedglob nomatch
        set -o vi
      '';
      zshLastToRun = lib.mkOrder 1500 "source ~/.p10k.zsh";
    in
      lib.mkMerge [ zshBeforeCompInit zshLastToRun ];

    shellAliases = {
      sw = "nh os switch";
      upd = "nh os switch --update";
      hms = "nh home switch";

      ff = "fastfetch";
      icat = "kitten icat";
      v = "vim";
      dnd = "makoctl mode -t do-not-disturb";

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
