_: {
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent.enableSshSupport = true;
}
