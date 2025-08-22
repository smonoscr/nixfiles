{ inputs, ... }:
{
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  # Impermanence configuration based on https://www.notashelf.dev/posts/impermanence
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      # System directories
      "/etc/nixos"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"

      # SSH and security
      {
        directory = "/etc/ssh";
        mode = "0755";
      }
      "/var/db/sudo"

      # Optional: Add more as needed
      "/var/lib/bluetooth"
    ];
    files = [
      # Essential system files
      "/etc/machine-id"

      # SSH host keys (critical!)
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
    users.simon = {
      directories = [
        "Downloads"
        "Documents"
        "Pictures"
        "Videos"
        "Music"
        {
          directory = ".ssh";
          mode = "0700";
        }
        {
          directory = ".gnupg";
          mode = "0700";
        }
      ];
      files = [
      ];
    };
  };
}
