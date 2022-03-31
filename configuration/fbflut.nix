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
      rev = "e771a4bb108b862e785f590c629a50aa553137e5";
      sha256 = "sha256-oJC2RhIEdnUZ3mO5fKFSNqNCSKjAStO7GYNA6PT3zrE=";
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
