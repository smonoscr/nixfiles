{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraLibraries = [
        # List library dependencies here
      ];
      extraPkgs = [
        wineWowPackages.stable
      ];
    })
  ];
}
