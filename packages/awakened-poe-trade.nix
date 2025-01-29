{ pkgs, ... }:
let
  version = "3.25.102";
  pname = "awakened-poe-trade";

  src = pkgs.fetchurl {
    url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v${version}/Awakened-PoE-Trade-${version}.AppImage";
    sha256 = "lcdKJ+B8NQmyMsv+76+eeESSrfR/7Mq6svO5VKaoNUY=";
  };

  appimageContents = pkgs.appimageTools.extractType2 { inherit pname version src; };
in

pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    cp ${appimageContents}/${pname}.desktop $out/share/applications/
  '';

  meta = {
    homepage = "https://snosme.github.io/awakened-poe-trade";
    description = "Path of Exile trading app for price checking";
    license = pkgs.lib.licenses.mit;
    mainProgram = "awakened-poe-trade";
    platforms = [ "x86_64-linux" ];
  };
}
