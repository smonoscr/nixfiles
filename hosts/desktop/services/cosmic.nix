_: {
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
  environment.sessionVariables.COSMIC_DISABLE_DIRECT_SCANOUT = "1";
}
