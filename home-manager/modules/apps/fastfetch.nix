{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        height = 16;
        padding = { left = 2; right = 2; };
        preserveAspectRatio = true;
      };
      display.separator = "  ";
      modules = [
        {
          type = "title";
          format = "{#title}~~ {user-name} {##51576d}at {#title}{host-name} ~~";
        }
        "break"
        { type = "os"; key = ""; }
        { type = "kernel"; key = ""; format = "{release}"; }
        { type = "display"; key = "󰹑"; }
        { type = "uptime"; key = ""; }
        "break"
        { type = "de"; key = "󰧨"; }
        { type = "shell"; key = ""; }
        { type = "terminal"; key = ""; }
        { type = "packages"; key = ""; }
        "break"
        { type = "cpu"; key = "󰻠"; }
        { type = "gpu"; key = "󰤽"; }
        { type = "memory"; key = ""; }
        { type = "disk"; key = ""; folders = [ "/" ]; }
        "break"
        { type = "colors"; paddingLeft = 4; }
      ];
    };
  };
}