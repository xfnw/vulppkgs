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

  fuzzball =
    stdenv.mkDerivation rec {
      pname = "fuzzball";
      version = "unstable-2024-01-29";

      src = fetchFromGitHub {
        owner = "fuzzball-muck";
        repo = "fuzzball";
        rev = "169b68cdf9fa1675e2986aab6cd018fab9f9a7f7";
        sha256 = "sha256-J6hIS8BaBYsn1BWOx4LaJ1E1VepGYilEGjAjaWzfY+Q=";
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

      ExecStart = "${fuzzball}/bin/fbmuck -gamedir ${gamedir} -dbin ${dbin} -dbout ${dbout} ${ports}";
    };
  };
}
