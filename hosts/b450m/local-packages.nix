{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ntfs3g
    (prismlauncher.override {
      jdks = [
        jdk21
      ];

      gamemodeSupport = true;
    })
  ];
}
