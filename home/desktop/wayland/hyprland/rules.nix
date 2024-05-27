_: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        # webcord
        "float, class:^(WebCord)$"
        "workspace 2, class:^(WebCord)$"
        "size 1200 800, class:^(WebCord)$"
        "center, class:^(WebCord)$"

        # steam
        "float, class:^(steam)$"
        "workspace 2, class:^(steam)$"
        "center, class:^(steam)$"

        "size 1200 800, title:^(Steam)$"
        "size 300 1000, title:^(Friends List)$"
        "size 800 800, title:^(Steam Settings)$"

        # ts3
        "float, title:^(TeamSpeak 3)$"
        "workspace 2, title:^(TeamSpeak 3)$"
        "size 450 600, title:^(TeamSpeak 3)$"
        "center, title:^(TeamSpeak 3)$"

        # suppress notification events when gaming
        "suppressevent maximize,class:.*"
        "noinitialfocus,title:(^notificationtoasts.*)"

        # idle inhibit on any class that is fullscreen
        "idleinhibit fullscreen, class:.*"

        # immediate
        "immediate, class:^(cs2)$"
        "immediate, class:^(gamescope|steam_app).*"
        "immediate, fullscreen:1"

        # make Firefox PiP window floating and sticky
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        # dim around specific applications
        "dimaround, class:^(xdg-desktop-portal-gtk)$"
        "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
      ];
    };
  };
}
