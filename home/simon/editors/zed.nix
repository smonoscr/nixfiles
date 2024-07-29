{ pkgs, ... }:
{
  home.packages = with pkgs; [ zed-editor ];

  # Zed settings
  #
  # For information on how to configure Zed, see the Zed
  # documentation: https://zed.dev/docs/configuring-zed
  #
  # To see all of Zed's default settings without changing your
  # custom settings, run the `open default settings` command
  # from the command palette or from `Zed` application menu.
  home.file.".config/zed/settings.json".text = ''
    {
      "telemetry": {
        "diagnostics": false,
        "metrics": false
      },
      "theme": {
        "mode": "system",
        "dark": "One Dark",
        "light": "One Light"
      },
      "ui_font_size": 16,
      "buffer_font_size": 15,
      "buffer_font_family": "JetBrainsMono Nerd Font",
      "autosave": {
        "after_delay": {
          "milliseconds": 1000
        },
      },
      "auto_update": false,
      "load_direnv": "direct",
      "current_line_highlight": "all",
      "scrollbar": {
        "show": "always",
        "cursors": true,
        "git_diff": true,
        "search_results": true,
        "selected_symbol": true,
        "diagnostics": true
      },
      "tab_bar": {
        "show": true,
        "show_nav_history_buttons": true
      },
      "tabs": {
        "close_position": "right",
        "file_icons": true,
        "git_status": true
      },
      "toolbar": {
        "breadcrumbs": true,
        "quick_actions": true
      },
      "enable_language_server": true,
      "ensure_final_newline_on_save": true,
      //"lsp": {
      //  "nixd": {
      //    "initialization_options": {
      //      "check": {
      //        "command": "clippy" // rust-analyzer.check.command (default: "check")
      //      }
      //    }
      //  }
      //}
      "format_on_save": "on",
      "formatter": "language_server",
      "use_autoclose": true,
      "file_types": {
        "Nix": ["*.nix"],
        "YAML": [".yaml" ".yml"],
        "Dockerfile": ["Dockerfile*"]
      }
    }
  '';
}
