{ config
, pkgs
, ...
}:

with pkgs;

let
  fbflut =
    stdenv.mkDerivation rec {
      pname = "fbflut";
      version = "unstable-2023-09-25";

      src = fetchFromGitHub {
        owner = "xfnw";
        repo = "fbflut";
        rev = "ddba6ff1cd511618f1b9a26f60fd1e0a4c0e628b";
        sha256 = "sha256-gldvlOVbg/Qi9MzLTB0nOLeG0DUu721c0FJGOd64MyA=";
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
