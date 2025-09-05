{ mylib, ... }:
{
  imports = mylib.scanPaths ./. {
    exclude = [
      "ananicy-cpp.nix"
      "gamescope.nix"
    ];
  };
}
