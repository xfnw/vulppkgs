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
        rev = "8dfced7399d25f4237cb15b307bbe2f8d62e2ac5";
        sha256 = "sha256-rTm+LgjaTMNrKFf2QQt7rpQb2otN1gebEUvXW0ge+eA=";
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
