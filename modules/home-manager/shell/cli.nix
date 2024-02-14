{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # file managers
    ranger
    yazi
    joshuto
  ];

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };
}
