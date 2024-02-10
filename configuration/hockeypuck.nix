{ config
, lib
, pkgs
, ...
}:

{
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "hockeypuck" ];
    ensureUsers = [{
      name = "hockeypuck";
      ensureDBOwnership = true;
    }];
  };

  services.hockeypuck.enable = true;
}

