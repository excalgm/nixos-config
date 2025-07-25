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

      v = "vim";

      ".." = "cd ..";
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
	
	programs.kitty.shellIntegration.enableZshIntegration = true;
	home.shell.enableZshIntegration = true;
}
