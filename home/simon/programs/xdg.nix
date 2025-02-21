{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.module.programs.xdg;

  #browser = [ "firefox.desktop" ];
  browser = [ "zen" ];
  chromeBrowser = [ "brave" ];
  zathura = [ "zathura" ];
  fileManager = [ "yazi" ];
  mailer = [ "proton-mail" ];
  editor = [ "zeditor" ];

  associations = {
    "text/html" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/unknown" = browser;
    "x-scheme-handler/chrome" = chromeBrowser;
    "application/xhtml+xml" = browser;
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xhtml" = browser;
    "application/x-extension-xht" = browser;

    "inode/directory" = fileManager;

    "audio/*" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "image/*" = [ "imv.desktop" ];

    "application/pdf" = zathura;

    "application/json" = editor;
    "text/plain" = editor;

    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
    "x-scheme-handler/discord" = [ "WebCord.desktop" ];
    "x-scheme-handler/mailto" = mailer;
  };
in
{

  options.module.programs.xdg = {
    enable = mkEnableOption "Enable xdg";
  };

  config = mkIf cfg.enable {
    xdg = {
      enable = true;
      cacheHome = "${config.home.homeDirectory}/.cache";
      configHome = "${config.home.homeDirectory}/.config";
      dataHome = "${config.home.homeDirectory}/.local/share";
      stateHome = "${config.home.homeDirectory}/.local/state";

      userDirs = {
        enable = true;
        createDirectories = true;

        # disable unused home dirs
        download = "${config.home.homeDirectory}/downloads";
        documents = "${config.home.homeDirectory}/documents";
        pictures = "${config.home.homeDirectory}/pictures";
        videos = null;
        desktop = null;
        publicShare = null;
        music = null;
        templates = null;

        extraConfig = {
          XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/screenshots";
        };
      };

      mimeApps = {
        enable = true;
        #associations.added = associations;
        defaultApplications = associations;
      };
      ## already set in nixos
      #portal = {
      #  enable = true;
      #  xdgOpenUsePortal = true;
      #  config = {
      #    common = {
      #      default = [
      #        "gtk"
      #      ];
      #    };
      #    hyprland = {
      #      default = [
      #        "hyprland"
      #        "gtk"
      #      ];
      #      "org.freedesktop.impl.portal.Secret" = [
      #        "gnome-keyring"
      #      ];
      #    };
      #  };
      #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      #};
    };
  };
}
