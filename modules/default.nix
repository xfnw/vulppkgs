{ pkgs, lib, ... }:

{
  imports = [
    ./fbflut.nix
    ./fuzzball.nix
    ./ungoogled-extensions.nix
    ./wahs.nix
  ];

  options.vulp.pkgs = lib.mkOption {
    type = lib.types.unspecified;
    description = "The package set to look for vulppkgs packages in";
    default = import ../. { inherit pkgs; };
  };
}
