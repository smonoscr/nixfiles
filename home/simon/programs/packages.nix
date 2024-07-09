{ pkgs, ... }:
{
  home.packages = with pkgs; [
    webcord-vencord
    spotify
    protonmail-desktop
    (lowPrio proton-pass) # FIXME package collision between proton-mail and proton-pass app.asar
    #bitwarden-desktop
    ## gaming
    teamspeak_client
    #lutris
    ## WINE
    #wineWowPackages.stable
    #wineWowPackages.waylandFull
    #winetricks
    #teamspeak5_client
    #bottles
    #path-of-building
    ## Mods
    r2modman
  ];
}
