{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = lib.mkBefore [
        "SUPER, Space, exec, dms ipc call spotlight toggle"
        "SUPER, V, exec, dms ipc call clipboard toggle"
        "SUPER, M, exec, dms ipc call processlist toggle"
        "SUPER, N, exec, dms ipc call notifications toggle"
        "SUPER, comma, exec, dms ipc call settings toggle"
        "SUPER, P, exec, dms ipc call notepad toggle"
        "SUPER, L, exec, dms ipc call lock lock"
        "SUPER, X, exec, dms ipc call powermenu toggle"
        "SUPER, C, exec, dms ipc call control-center toggle"
      ];

      bindl = lib.mkBefore [
        ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
        ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
        ", XF86AudioMute, exec, dms ipc call audio mute"
        ", XF86AudioMicMute, exec, dms ipc call audio micmute"

        ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 ''"
        ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 ''"
      ];
    };
  };
}
