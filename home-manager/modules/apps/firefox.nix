{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          duckduckgo-privacy-essentials
          facebook-container
          #sponsorblock
          ublock-origin
          youtube-recommended-videos
        ];
      };
    };
  };
}
