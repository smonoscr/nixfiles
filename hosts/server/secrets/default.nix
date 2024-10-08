{ inputs, ... }:
let
  secretsFile = "${inputs.nixsecrets}/sops-nix/server/secrets.yaml";
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    validateSopsFiles = true;
    defaultSopsFile = secretsFile;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets = {
      c3NoLXB1Yi1rZXk = {
        mode = "0600";
        owner = "root";
        path = "/root/.ssh/authorized_keys";
      };
      c3NoLXByaXZhdGUta2V5 = {
        mode = "0600";
        owner = "root";
        path = "/root/.ssh/id_ed25519";
      };
      V0lGSQ = {
        path = "/etc/wpa_supplicant.conf";
      };
      Z2l0bGFiLXJ1bm5lci1yZWdpc3RyYXRpb24 = { };
    };
  };
}
