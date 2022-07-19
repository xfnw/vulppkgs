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
      rev = "0fe01249de3b2d4dce185e0b79af071b0de7bf02";
      sha256 = "sha256-JdH6YkrERAf5vB5bmyQhygSTIGUo/EHfdU56sqWwOzE=";
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
