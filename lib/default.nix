{ lib, ... }:
{
  scanPaths =
    path:
    {
      exclude ? [ ],
    }:
    let
      allFiles = builtins.attrNames (
        lib.attrsets.filterAttrs (
          filename: _type:
          (_type == "directory") # include directories
          || (
            (filename != "default.nix") # ignore default.nix
            && (lib.strings.hasSuffix ".nix" filename) # include .nix files
            && (!lib.any (excluded: filename == excluded) exclude) # exclude files in exclude list
          )
        ) (builtins.readDir path)
      );
    in
    builtins.map (f: (path + "/${f}")) allFiles;
}
