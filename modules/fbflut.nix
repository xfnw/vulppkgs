{ config
, lib
, pkgs
, vpkgs
, ...
}:

let
  cfg = config.vulp.services.fbflut;
  gcfg = config.services.getty;
in
{
  options.vulp.services.fbflut = {
    enable = lib.mkEnableOption "Enable the fbflut pixelflut server";
    package = lib.mkPackageOption vpkgs "fbflut" { };
  };

  config = lib.mkIf cfg.enable {
    users.users.fbflut = {
      isSystemUser = true;
      group = "video";
      shell = "${cfg.package}/bin/fbflut";
    };

    systemd.services."getty@tty1".overrideStrategy = "asDropin";
    systemd.services."getty@tty1".serviceConfig.ExecStart = [
      ""
      "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${gcfg.loginProgram} --autologin fbflut --noclear --keep-baud %I 115200,38400,9600 $TERM"
    ];
  };
}
