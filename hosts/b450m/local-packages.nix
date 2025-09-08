{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    tenacity
    ntfs3g
    libresprite
    dbeaver-bin
    (prismlauncher.override {
      jdks = [
        jdk21
      ];

      gamemodeSupport = true;
    })
  ];
}
