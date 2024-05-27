_: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        # webcord
        "float, class:^(WebCord)$"
        "workspace 2, class:^(WebCord)$"
        "size 450 600, class:^(WebCord)$"
        "center, class:^(WebCord)$"

        # steam
        "float, class:^(steam)$"
        "float, initialclass:^(steam)$"
        "workspace 2, class:^(steam)$"
        "size 450 600, title:^(Steam)$"

        "float, title:^(Friends List)$"
        "size 1000 300, title:^(Friends List)$"
        "size 800 800, title:^(Steam Settings)$"

        # ts3
        "float, title:^(TeamSpeak 3)$"
        "workspace 2, title:^(TeamSpeak 3)$"
        "size 450 600, title:^(TeamSpeak 3)$"

        # suppress notification events when gaming
        "idleinhibit fullscreen, class:.*"
        "suppressevent maximize,class:.*"
        "noinitialfocus,title:(^notificationtoasts.*)"

        # immediate
        "immediate, class:^(cs2)$"
        "immediate, class:^(gamescope|steam_app).*"
        "immediate, fullscreen:1"

        # make Firefox PiP window floating and sticky
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
      ];
    };
  };
}
