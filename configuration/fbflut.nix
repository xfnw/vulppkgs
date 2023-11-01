{ config
, pkgs
, ...
}:

with pkgs;

let
  gcfg = config.services.getty;
  fbflut =
    stdenv.mkDerivation rec {
      pname = "fbflut";
      version = "unstable-2023-11-01";

      src = fetchFromGitHub {
        owner = "xfnw";
        repo = "fbflut";
        rev = "c6ed6a3b25105d5f245bc85bc582a32c7ff2672f";
        sha256 = "sha256-32qC78u1rHdc+QOWZ5ckwhrgmfJcrhWJo8LpdkT/fAw=";
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
