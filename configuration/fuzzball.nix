{ config
, pkgs
, pcre
, ...
}:

with pkgs;

let
  gamedir = "/var/lib/fuzzball"; # needs to be manually created
  dbold = "${gamedir}/data/std-db.old";
  dbin = "${gamedir}/data/std-db.db";
  dbout = "${gamedir}/data/std-db.new";
  ports = "4201";

  fuzzball =
    stdenv.mkDerivation rec {
      pname = "fuzzball";
      version = "unstable-2024-01-14";

      src = fetchFromGitHub {
        owner = "fuzzball-muck";
        repo = "fuzzball";
        rev = "402d60dbfaa3a41c14a6ec4bb560e07400459ad7";
        sha256 = "sha256-evFPXblaxCLTCXQC3eQLeBg0NWXnWI+dQEZwk02gh3U=";
      };

      # fuzzball uses insecure non-static format strings
      hardeningDisable = [ "format" ];

      buildInputs = [ pkgs.pcre.dev ];

      configurePhase = ''
        ./configure --with-pcre=${pkgs.pcre.dev} --prefix=$out
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

      ExecStart = "${fuzzball}/bin/fbmuck -gamedir ${gamedir} -dbin ${dbin} -dbout ${dbout} ${ports}";
    };
  };
}
