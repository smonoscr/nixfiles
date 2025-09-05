{
  description = "smonoscr's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # default
    #nixpkgs.url = "github:NixOS/nixpkgs/7fd36ee82c0275fb545775cc5e4d30542899511d"; # default pinned commit hash
    #nixpkgs.url = "github:smonoscr/nixpkgs/vulkanlayer-anti-lag"; # testing private
    nixpkgs-small.url = "github:NixOS/nixpkgs/nixos-unstable-small"; # faster
    #nixpkgs-git.url = "github:NixOS/nixpkgs/master"; # better not
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05"; # current stable

    systems.url = "github:nix-systems/x86_64-linux"; # or default-linux

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
        home-manager.follows = "home-manager";
        systems.follows = "systems";
      };
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixsecrets = {
      url = "git+ssh://git@codeberg.org/smonoscr/nixsecrets.git";
    };
    wallpaper = {
      url = "git+ssh://git@codeberg.org/smonoscr/wallpaper.git";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      let
        inherit (inputs.nixpkgs) lib;
        mylib = import "${self}/lib" { inherit lib; };
      in
      {
        imports = [
          ./checks
        ];

        systems = import inputs.systems;

        flake = {
          templates = import "${self}/templates" { inherit self; };

          nixosConfigurations = {
            desktop = inputs.nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit inputs mylib;
                outputs = self;
              };
              modules = [
                ./hosts/desktop/configuration.nix
              ];
            };
          };
        };

        perSystem =
          {
            pkgs,
            config,
            ...
          }:
          {
            formatter = config.treefmt.build.wrapper;

            devShells.default = pkgs.mkShell {
              name = "nixfiles";
              shellHook = ''
                ${config.pre-commit.installationScript}
              '';
            };
          };
      }
    );
}
