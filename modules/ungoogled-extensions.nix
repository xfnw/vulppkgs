{ config
, lib
, ...
}:

let
  cfg = config.vulp.programs.ungoogled-extensions;
in
{
  options.vulp.programs.ungoogled-extensions = {
    enable = lib.mkEnableOption "Enable extensions for ungoogled chromium";
    extensions = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with config.vulp.pkgs.ungoogled-extensions; [ ubo-lite ];
      description = "Set of extensions to install";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = cfg.extensions;
    environment.pathsToLink = [ "/share/chromium/extensions" ];
  };
}
