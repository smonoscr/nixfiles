{config, ...}: {
  sops = {
    validateSopsFiles = false;
    defaultSopsFile = "${config.home.homeDirectory}/code/nixsecrets/secrets/work/secrets.yaml";
    age = {
      sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_rsa"];
      keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
      generateKey = false;
    };
    secrets = {
      d29yay1yc2EucHVi = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa.pub";
        mode = "0600";
      };
      d29yay1yc2E = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa";
        mode = "0600";
      };
    };
  };
}
