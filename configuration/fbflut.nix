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
      rev = "532e731e9c3757f3c26080effe3861e79301421f";
      sha256 = "sha256-0AmV273jjh+2fVbXnNw6hUWqXeEK08QE9PEzJLT0I7o=";
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
