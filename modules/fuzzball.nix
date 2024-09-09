{ config
, lib
, pkgs
, vpkgs
, ...
}:

let
  cfg = config.vulp.services.fuzzball;
  dbold = "${cfg.stateDir}/data/std-db.old";
  dbin = "${cfg.stateDir}/data/std-db.db";
  dbout = "${cfg.stateDir}/data/std-db.new";

  inherit (lib)
    mkOption
    types
    ;
in
{
  options.vulp.services.fuzzball = {
    enable = lib.mkEnableOption "Enable the fuzzball muck server";
    package = lib.mkPackageOption vpkgs "fuzzball" { };

    ports = mkOption {
      type = types.str;
      example = "4201 -sport 4202";
      default = "4201";
      description = "List of ports to listen on";
    };

    stateDir = mkOption {
      type = types.str;
      default = "/var/lib/fuzzball";
      description = "Fuzzball game directory, must be manually created";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.fuzzball = {
      isSystemUser = true;
      group = "nogroup";
    };

    systemd.services.fuzzball = {
      enable = true;
      wantedBy = [ "multi-user.target" ];

      preStart = ''
        cp -f ${dbin} ${dbold}
        cp ${dbout} ${dbin}
      '';

      serviceConfig = {
        User = "fuzzball";
        Type = "forking";
        PIDFile = "${cfg.stateDir}/fbmuck.pid";
        ProtectHome = "yes";
        ProtectSystem = "strict";
        ReadWritePaths = cfg.stateDir;

        ExecStart = with cfg;
          "${package}/bin/fbmuck -gamedir ${stateDir} -dbin ${dbin} -dbout ${dbout} ${ports}";
      };
    };
  };
}
