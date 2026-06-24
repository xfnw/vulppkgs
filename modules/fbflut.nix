{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.vulp.services.fbflut;
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
        while [ ! -r /dev/fb0 ] || [ ! -w /dev/fb0 ]; do
          ${pkgs.coreutils}/bin/sleep 1
        done
      '';

      serviceConfig = {
        ExecStart = "${cfg.package}/bin/fbflut";
        StandardOutput = "tty";
        TTYPath = "/dev/tty1";
        User = "fbflut";
        CapabilityBoundingSet = "";
        NoNewPrivileges = true;
        ProtectClock = true;
        ProtectKernelLogs = true;
        ProtectControlGroups = true;
        ProtectKernelModules = true;
        PrivateMounts = true;
        SystemCallArchitectures = "native";
        MemoryDenyWriteExecute = true;
        RestrictNamespaces = true;
        RestrictSUIDSGID = true;
        ProtectHostname = true;
        LockPersonality = true;
        ProtectKernelTunables = true;
        RestrictAddressFamilies = [ "AF_INET6" "AF_INET" ];
        RestrictRealtime = true;
        RemoveIPC = true;
        ProtectSystem = "strict";
        ProtectProc = "invisible";
        ProtectHome = true;
        PrivateTmp = true;
        SystemCallFilter = [
          "@system-service"
          "~@resources @privileged"
        ];
      };
    };

    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
  };
}
