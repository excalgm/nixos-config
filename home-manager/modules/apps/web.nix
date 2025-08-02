{ pkgs, lib, ... }: let browser = lib.getExe pkgs.ungoogled-chromium; in {
  xdg.desktopEntries.earweb = {
    name = "ear (web)";
    icon = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/radiance-project/ear-web/refs/heads/main/res/icons/256x256.png";
      hash = "sha256-etFb/jVE3CkPQWqr90HwWfwJFgH0Lxp+FIcBR33HxEg=";
    };
    exec = "${browser} --enable-features=WebBluetooth --app=https://earweb.bttl.xyz";
  };
}
