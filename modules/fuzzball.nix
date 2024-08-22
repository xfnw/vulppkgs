{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.vulp.services.fuzzball;
  dbold = "${cfg.stateDir}/data/std-db.old";
  dbin = "${cfg.stateDir}/data/std-db.db";
  dbout = "${cfg.stateDir}/data/std-db.new";

  fuzzball = pkgs.stdenv.mkDerivation rec {
    pname = "fuzzball";
    version = "7.2.1";

    src = pkgs.fetchFromGitHub {
      owner = "fuzzball-muck";
      repo = "fuzzball";
      rev = "6c985b6679843122a78b9ef76609171de3614e97";
      sha256 = "sha256-aHOJxEp1wfM+ZZ/lBUVv5C1Vxie3wryerUCSkNG2pgU=";
    };

    buildInputs = [ pkgs.openssl.dev pkgs.pcre.dev ];

    configurePhase = ''
      ./configure --with-pcre=${pkgs.pcre.dev} --with-ssl=${pkgs.openssl.dev} --prefix=$out
    '';
  };

  inherit (lib)
    mkOption
    types
    ;
in
{
  options.vulp.services.fuzzball = {
    enable = lib.mkEnableOption "Enable the fuzzball muck server";

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
          "${fuzzball}/bin/fbmuck -gamedir ${stateDir} -dbin ${dbin} -dbout ${dbout} ${ports}";
      };
    };
  };
}
