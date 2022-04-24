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
      rev = "86928fa99040904054048f41ade7f36f45eb008d";
      sha256 = "sha256-zhykNIebmXX19H3JakDdxlgBXSTluSMSTTAmCuNBWPg=";
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
