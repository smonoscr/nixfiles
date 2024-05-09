{pkgs, ...}: {
  users = {
    groups.simon.gid = 1000;
    users = {
      simon = {
        initialPassword = "123";
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "video"
          "gamemode"
          "corectrl"
        ];
      };
    };
    defaultUserShell = pkgs.zsh;
  };
}
