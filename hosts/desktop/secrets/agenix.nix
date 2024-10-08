{ config, inputs, ... }:
let
  secretsDirectory = "${inputs.nixsecrets}/agenix/simon";
in
{

  imports = [ inputs.agenix.nixosModules.default ];

  age = {
    secrets = {
      ssh = {
        file = "${secretsDirectory}/ssh.age";
        path = "${config.users.users.simon.home}/.ssh/id_ed25519";
        owner = "simon";
        mode = "0600";
        name = "id_ed25519";
      };
      sshPub = {
        file = "${secretsDirectory}/ssh-pub.age";
        path = "${config.users.users.simon.home}/.ssh/id_ed25519.pub";
        owner = "simon";
        mode = "0600";
        name = "id_ed25519.pub";
      };
      nixAccessToken = {
        file = "${secretsDirectory}/nix-access-token.age";
      };
      yubikeyU2fKeys = {
        file = "${secretsDirectory}/yubikey-u2f-keys.age";
      };
      userPin = {
        file = "${secretsDirectory}/user-pin.age";
      };
    };
  };
}
