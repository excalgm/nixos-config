{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
#        font = "JetBrainsMono Nerd Font";
        icon-theme = "MoreWaita";
        placeholder = "Enter something...";
        prompt = "🔍 ";
        terminal = "kitty --hold";
        lines = 15;
        line-height = 20;
        inner-pad = 5;
        width = 50;
        horizontal-pad = 20;
      };
#      colors = {
#        background = "282828ff";
#        text = "ebdbb2ff";
#        prompt = "bdae93ff";
#        placeholder = "a89984ff";
#        input = "ebdbb2ff";
#        match = "a89984ff";
#        selection = "ebdbb2ff";
#        selection-text = "282828ff";
#        selection-match = "7c6f64ff";
#        border = "3c3836ff";
#      };
    };
  };
}
