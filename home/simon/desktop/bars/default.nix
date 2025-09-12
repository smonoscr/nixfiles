{ mylib, ... }:
{
  imports = mylib.scanPaths ./. {
    exclude = [
      "hyprpanel"
      "caelestia"
    ];
  };
}
