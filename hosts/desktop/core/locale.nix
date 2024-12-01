_: {
  time.timeZone = "Europe/Berlin";

  services.xserver.xkb = {
    layout = "de";
    variant = "";
    options = "";
  };

  i18n =
    let
      de = "de_DE.UTF-8";
    in
    {
      defaultLocale = "en_US.UTF-8";

      extraLocaleSettings = {
        LANGUAGE = "en_US.UTF-8";
        LANG = "en_US.UTF-8";
        LC_ALL = de;
        LC_ADDRESS = de;
        LC_IDENTIFICATION = de;
        LC_MEASUREMENT = de;
        LC_MONETARY = de;
        LC_NAME = de;
        LC_NUMERIC = de;
        LC_PAPER = de;
        LC_TELEPHONE = de;
        LC_TIME = de;
      };
      supportedLocales = [
        "en_US.UTF-8/UTF-8"
        "de_DE.UTF-8/UTF-8"
      ];
    };
}
