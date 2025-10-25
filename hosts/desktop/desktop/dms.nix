{ inputs, ... }:
{
  imports = [
    inputs.dms.nixosModules.greeter
  ];
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "hyprland"; # or set to hyprland
  };
}
