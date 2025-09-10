{ mylib, ... }:
{
  imports = mylib.scanPaths ./. {
    exclude = [
      "noctalia"
      "caelestia"
    ];
  };
}
