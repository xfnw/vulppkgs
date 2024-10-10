{ pkgs, ... }:

{
  imports = [
    ./fbflut.nix
    ./fuzzball.nix
    ./ungoogled-extensions.nix
  ];

  _module.args.vpkgs = import ../. { inherit pkgs; };
}
