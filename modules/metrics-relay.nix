{ config
, lib
, utils
, ...
}:

let
  cfg = config.vulp.services.metrics-relay;
in
{
  options.vulp.services.metrics-relay = {
    enable = lib.mkEnableOption "Enable metrics-relay";
    package = lib.mkPackageOption config.vulp.pkgs "metrics-relay" { };
    bind = lib.mkOption {
      type = lib.types.str;
      default = "[::1]:8429";
      description = "the address to bind";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.metrics-relay = {
      enable = true;
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = utils.escapeSystemdExecArgs [
          "${cfg.package}/bin/metrics-relay"
        ];
        DynamicUser = true;
        PrivateDevices = true;
        ProtectClock = true;
        ProtectHome = true;
        ProtectSystem = "strict";
        CapabilityBoundingSet = "";
        ProtectKernelLogs = true;
        ProtectControlGroups = true;
        ProtectKernelModules = true;
        SystemCallArchitectures = "native";
        MemoryDenyWriteExecute = "true";
        RestrictNamespaces = true;
        ProtectHostname = true;
        LockPersonality = true;
        ProtectKernelTunables = true;
        RestrictRealtime = true;
        ProtectProc = "invisible";
        PrivateUsers = true;
        RestrictAddressFamilies = [
          "AF_INET6"
          "AF_INET"
        ];
        SystemCallFilter = [
          "@system-service"
          "~@resources @privileged"
        ];
      };
    };
  };
}
