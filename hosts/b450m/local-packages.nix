{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    ntfs3g
  ];
}
