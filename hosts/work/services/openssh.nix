{ ... }:
{
  services = {
    openssh = {
      enable = true;
      settings = {
        UseDns = true;
        AllowUsers = null;
      };
    };

    resolved = {
      enable = true;
      dnssec = "allow-downgrade";
      dnsovertls = "opportunistic";
    };
  };
}
