{ config
, lib
, utils
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
        DynamicUser = true;
      };
    };
  };
}
