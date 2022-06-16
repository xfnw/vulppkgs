{ config, lib, pkgs, ... }:

{

  services.postgresql.enable = true;
  services.postgresql.ensureDatabases = [ "hockeypuck" ];
  services.postgresql.ensureUsers = [{
    name = "hockeypuck";
    ensurePermissions."DATABASE hockeypuck" = "ALL PRIVILEGES";
  }];

  services.hockeypuck = {
    enable = true;
  };

}

