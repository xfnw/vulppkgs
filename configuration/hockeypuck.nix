{ config, lib, pkgs, ... }:

{

  services.postgresql.enable = true;
  services.postgresql.ensureDatabases = [ "hockeypuck" ];
  services.postgresql.ensureUsers = [{
    name = "hockeypuck";
    ensureDBOwnership = true;
  }];

  services.hockeypuck = {
    enable = true;
  };

}

