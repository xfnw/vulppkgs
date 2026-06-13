{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.vulp.services.fbflut;
  gcfg = config.services.getty;
in
{
  options.vulp.services.fbflut = {
    enable = lib.mkEnableOption "Enable the fbflut pixelflut server";
    package = lib.mkPackageOption config.vulp.pkgs "fbflut" { };
  };

  config = lib.mkIf cfg.enable {
    users.users.fbflut = {
      isSystemUser = true;
      group = "video";
    };

    systemd.services.fbflut = {
      enable = true;
      after = [ "getty.target" ];
      conflicts = [ "getty@tty1.service" "autovt@tty1.service" ];
      wantedBy = [ "multi-user.target" ];

      # FIXME: surely there is a better way to wait for /dev/fb0?
      # adding a dependency on dev-fb0.device just times out :(
      preStart = ''
        while [ ! -e /dev/fb0 ]; do
          ${pkgs.coreutils}/bin/sleep 1
        done
      '';

      serviceConfig = {
        ExecStart = "${cfg.package}/bin/fbflut";
        StandardOutput = "tty";
        TTYPath = "/dev/tty1";
      };
    };

    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
  };
}
