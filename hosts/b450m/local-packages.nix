{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ntfs3g
    dbeaver-bin
    (prismlauncher.override {
      jdks = [
        jdk21
      ];

      gamemodeSupport = true;
    })
  ];
}
