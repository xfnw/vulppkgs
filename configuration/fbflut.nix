{ config
, pkgs
, ...
}:

with pkgs;

let
  fbflut =
    stdenv.mkDerivation rec {
      pname = "fbflut";
      version = "unstable-2022-12-03";

      src = fetchFromGitHub {
        owner = "xfnw";
        repo = "fbflut";
        rev = "c5a243df89ee58d06ea3b0a43179109633c60bd3";
        sha256 = "sha256-qPFeMXuF/Z5hBqtYapJ4O0YfWZV8MTQsGrnzv2JsBGU=";
      };

      postConfigure = ''
        substituteInPlace Makefile --replace c99 $CC
      '';

      installPhase = ''
        install -D fbflut $out/bin/fbflut
      '';
    };
in
{
  users.users.fbflut = {
    isSystemUser = true;
    group = "video";
    shell = "${fbflut}/bin/fbflut";
  };
  services.getty.autologinUser = "fbflut";
}
