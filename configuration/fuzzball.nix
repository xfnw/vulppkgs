{ config
, pkgs
, ...
}:

with pkgs;

let
  gamedir = "/var/lib/fuzzball"; # needs to be manually created
  dbold = "${gamedir}/data/std-db.old";
  dbin = "${gamedir}/data/std-db.db";
  dbout = "${gamedir}/data/std-db.new";
  ports = "4201";

  fuzzball = stdenv.mkDerivation rec {
    pname = "fuzzball";
    version = "unstable-2024-03-27";

    src = fetchFromGitHub {
      owner = "fuzzball-muck";
      repo = "fuzzball";
      rev = "71e343f341d48333a5453715a66320ed17e75dee";
      sha256 = "sha256-7sHM0jqRE720ilSN5nI/MNgnbNPtASCqLFSZO4VldMM=";
    };

    buildInputs = [ pkgs.openssl.dev pkgs.pcre.dev ];

    configurePhase = ''
      ./configure --with-pcre=${pkgs.pcre.dev} --with-ssl=${pkgs.openssl.dev} --prefix=$out
    '';
  };
in
{
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
      PIDFile = "${gamedir}/fbmuck.pid";
      ProtectHome = "yes";
      ProtectSystem = "strict";
      ReadWritePaths = gamedir;

      ExecStart =
        "${fuzzball}/bin/fbmuck -gamedir ${gamedir} -dbin ${dbin} -dbout ${dbout} ${ports}";
    };
  };
}
