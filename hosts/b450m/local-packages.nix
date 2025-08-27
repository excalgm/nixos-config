{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    ntfs3g
    (prismlauncher.override {
      jdks = [
        jdk21
      ];

      gamemodeSupport = true;
    })
  ];
}
