{ config
, pkgs
, ...
}:

with pkgs;

let fbflut =
  stdenv.mkDerivation rec {
    pname = "fbflut";
    version = "unstable-2022-03-14";

    src = fetchFromGitHub {
      owner = "xfnw";
      repo = "fbflut";
      rev = "02554ea5472cc92b1dd30c0fadb960af0e804cda";
      sha256 = "sha256-sX/DgeA9HXDswnENaeVcuF2tIDlXv1ddNQhR9iR5Bkk=";
    };

    postConfigure = ''
      substituteInPlace Makefile --replace c99 $CC
    '';

    installPhase = ''
      install -D fbflut $out/bin/fbflut
    '';
  }; in
{
  users.users.fbflut = {
    isSystemUser = true;
    group = "video";
    shell = "${fbflut}/bin/fbflut";
  };
  services.getty.autologinUser = "fbflut";
}
