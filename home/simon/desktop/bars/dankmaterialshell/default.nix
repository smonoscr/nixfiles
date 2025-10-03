{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    #inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    inputs.dankmaterialshell.homeModules.dankMaterialShell.default
  ];

  #xdg.configFile."DankMaterialShell/colors.json".source = ./colors.json;

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableBrightnessControl = false;
    enableNightMode = false;
    enableCalendarEvents = false;
    #niri = {
    #  enableKeybinds = false;
    #  enableSpawn = false;
    #};
    quickshell.package = inputs.quickshell.packages.${pkgs.system}.default;
  };
}
