{ mylib, ... }:
{
  imports = mylib.scanPaths ./. {
    exclude = [
      "greetd.nix"
    ];
  };
}
