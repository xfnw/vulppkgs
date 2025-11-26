{ config
, lib
, utils
, pkgs
, vpkgs
, ...
}:

let
  cfg = config.vulp.services.wahs;

  inherit (lib)
    mkOption
    types
    ;
in
{
  options.vulp.services.wahs = {
    enable = lib.mkEnableOption "Enable the wahs server";
    package = lib.mkPackageOption vpkgs "wahs" { };
    bind = mkOption {
      type = types.str;
      default = "[::1]:0";
      description = "the socket address to bind to";
    };
    directories = mkOption {
      type = types.listOf types.path;
      default = [ "/var/lib/wahs" ];
      description = "directories to look for cdx files";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.wahs = {
      enable = true;
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = utils.escapeSystemdExecArgs ([
          "${cfg.package}/bin/wahs"
          "--bind"
          cfg.bind
          "--"
        ] ++ cfg.directories);
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
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
        RestrictAddressFamilies = [
          "AF_INET6"
          "AF_INET"
        ];
        SystemCallFilter = [
          "@system-service"
        ];
      };
    };
  };
}
