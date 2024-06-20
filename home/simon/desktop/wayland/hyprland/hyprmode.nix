{ config, ... }:
{
  home.file."${config.xdg.configHome}/hypr/hypr_gamemode.sh" = {
    text = ''
      #!/usr/bin/env sh

      HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

      if [ "$HYPRGAMEMODE" = 1 ] ; then
          hyprctl --batch "\
              keyword animations:enabled 0;\
              keyword decoration:drop_shadow 0;\
              keyword decoration:blur:enabled 0;\
              keyword general:gaps_in 0;\
              keyword general:gaps_out 0;\
              keyword general:border_size 1;\
              keyword decoration:rounding 0;\
              keyword monitor 'DP-1,2560x1440@165,auto,1'"
          corectrl -m 'gaming'
          pkill ags
          exit
      fi
      hyprctl reload
    '';
  };
}
