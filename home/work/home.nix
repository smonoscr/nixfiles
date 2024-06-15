{pkgs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./home-manager.nix
    ./browser/firefox
    ./desktop/x11/i3
    ./editors/vscodium.nix
    ./editors/nixvim.nix
    ./editors/zed.nix
    ./programs/autorandr.nix
    ./programs/dircolors.nix
    ./programs/docker.nix
    ./programs/fzf.nix
    ./programs/gpg.nix
    ./programs/gtk.nix
    ./programs/jq.nix
    ./programs/k9s.nix
    ./programs/packages.nix
    ./programs/qt.nix
    ./programs/ssh.nix
    ./programs/tmux.nix
    ./programs/xdg.nix
    ./programs/zathura.nix
    #./secrets/sops.nix #FIXME
    ./services/autorandr.nix
    ./services/fonts.nix
    ./services/polkit-agent.nix
    ./services/remmina.nix
    ./services/udiskie.nix
    ./terminal
  ];

  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
    stateVersion = "23.11";
    packages = with pkgs; [
      slack
      virt-manager
      libreoffice
      remmina
      obsidian
      yq
    ];
    sessionVariables.BROWSER = "firefox";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
