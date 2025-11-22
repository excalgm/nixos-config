{ pkgs, user, ... } : {
  system.activationScripts.run-matugen-once = ''
    if [ ! -f /home/${user}/.local/share/matugen-run-once ]; then
      su -u ${user} ${pkgs.vscode}/bin/code --install-extension HyprLuna.hyprluna-theme
      touch /home/${user}/.local/share/matugen-run-once
    fi
  '';
}
