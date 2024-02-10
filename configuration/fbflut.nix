{ config
, pkgs
, ...
}:

with pkgs;

let
  gcfg = config.services.getty;
  fbflut = stdenv.mkDerivation rec {
    pname = "fbflut";
    version = "unstable-2024-01-13";

    src = fetchFromGitHub {
      owner = "xfnw";
      repo = "fbflut";
      rev = "571b7db5dc52adbde613238f4f389d047f118993";
      sha256 = "sha256-gbi2UVCnuXCWZ8biPtpE4/FQpSH5moqjoaQuiFwNKXk=";
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

  systemd.services."getty@tty1".overrideStrategy = "asDropin";
  systemd.services."getty@tty1".serviceConfig.ExecStart = [
    ""
    "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${gcfg.loginProgram} --autologin fbflut --noclear --keep-baud %I 115200,38400,9600 $TERM"
  ];
}
