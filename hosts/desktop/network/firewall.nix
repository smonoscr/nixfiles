_: {
  networking = {
    firewall = {
      enable = true;
      trustedInterfaces = [
        "tailscale0"
        "virbr0"
        "virbr1"
        "vnet0"
      ];
    };
    nftables = {
      enable = true;
    };
  };
}
