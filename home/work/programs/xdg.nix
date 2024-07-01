{ config, pkgs, ... }:
{
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];
  };
  home.packages = [
    # used by `gio open` and xdp-gtk
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      foot "$@"
    '')
    pkgs.xdg-utils
  ];
}
