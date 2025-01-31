{ pkgs, ... }:
let
  inherit (pkgs.zed-editor) version remote_server;
  binary_name = "zed-remote-server-stable-${version}";
in
{
  #  you may want to consider using the nixpkgs provided server instead if you have custom patches to apply or mistrust whatever binary upstream Zed is downloading to your server
  # use this magic to only symlink the binary and not the directory, so Zed will successfully fall back to its own binary upload if the remote package version does not match
  home.file.".zed_server/${binary_name}".source = "${remote_server}/bin/${binary_name}";

  programs.zed-editor = {
    extensions = [
      "dockerfile"
      "html"
      "nix"
      "toml"
      "git-firefly"
      "xml"
      "vscode-dark-modern"
      "java"
      "helm"
      "ansible"
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "VSCode Dark Modern";
        dark = "VSCode Dark Modern";
      };
      base_keymap = "VSCode";
      features = {
        inline_completion_provider = "none";
      };
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 15;
      buffer_line_height = "standard";
      ui_font_family = "Inter";
      ui_font_size = 16;
      confirm_quit = true;
      show_whitespaces = "boundary";
      calls = {
        mute_on_join = true;
        share_on_join = false;
      };
      indent_guides = {
        coloring = "indent_aware";
      };
      inlay_hints = {
        enabled = true;
      };
      project_panel = {
        indent_size = 15;
        auto_fold_dirs = false;
      };
      outline_panel = {
        indent_size = 15;
        auto_fold_dirs = false;
      };
      collaboration_panel = {
        button = false;
      };
      git_panel = {
        button = true;
      };
      assistant = {
        enabled = false;
        button = false;
      };
      #language_models = {
      #  ollama = {
      #    api_url = "http://localhost:11434";
      #    low_speed_timeout_in_seconds = 900;
      #  };
      #};
      autosave = {
        after_delay = {
          milliseconds = 2000;
        };
      };
      tabs = {
        git_status = true;
        file_icons = true;
        always_show_close_button = true;
        activate_on_close = "neighbour";
        show_diagnostics = "all";
      };
      extend_comment_on_newline = false;
      tab_size = 2;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      auto_update = false;
      diagnostics = {
        include_warnings = true;
      };
      file_scan_exclusions = [
        "**/.direnv"
        "**/.pre-commit-config.yaml"
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/.jj"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
      ];
      journal = {
        hour_format = "hour24";
      };
      load_direnv = "shell_hook";
      terminal = {
        env = {
          EDITOR = "zed --wait";
        };
        line_height = "standard";
        font_size = 14;
      };
      file_types = {
        "Plain Text" = [ "txt" ];
        JSON = [ "flake.lock" ];
        JSONC = [
          "**/.zed/**/*.json"
          "**/zed/**/*.json"
          "**/Zed/**/*.json"
          "**/.vscode/**/*.json"
        ];
        "Shell Script" = [ ".env.*" ];
        Dockerfile = [ "Dockerfile*" ];
        TOML = [ "uv.lock" ];
      };
      languages = {
        Nix = {
          formatter = [
            {
              language_server = {
                name = "nixd";
              };
            }
            {
              external = {
                command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
                arguments = [ ];
              };
            }
          ];
          language_servers = [
            "nixd"
            "nil"
          ];
        };
        Markdown = {
          format_on_save = "on";
          remove_trailing_whitespace_on_save = false; # If you rely on invisible trailing whitespace being converted to <br />
        };
        YAML = {
          # this fixes worng error for multiple manifest documents in a single .yaml file. docker-compose extensions fault
          language_servers = [
            "yaml-language-server"
            "!docker-compose"
          ];
        };
      };
      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };
        nixd = {
          binary = {
            path_lookup = true;
          };
          settings = {
            diagnostics = {
              suppress = [ "sema-extra-with" ];
            };
          };
        };
        nil = {
          binary = {
            path_lookup = true;
          };
          settings = {
            diagnostics = {
              ignored = [ "unused_binding" ];
            };
          };
        };
      };
    };
  };
}
