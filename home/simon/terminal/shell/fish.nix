_: {
  imports = [ ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Disable the greeting message.
      set fish_greeting

      # color input
      set fish_color_command green
      set fish_color_normal brwhite
      set fish_color_param brwhite
      set fish_color_option cyan
      set fish_color_quote yellow

      set -x COLORTERM truecolor
      set -x TERM xterm-256color
    '';
  };
}
