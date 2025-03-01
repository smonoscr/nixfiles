{ pkgs, ... }:
{
  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope_git;
    capSysNice = false; # FIXME https://discourse.nixos.org/t/unable-to-activate-gamescope-capsysnice-option/37843
    args = [ ];
  };
}
