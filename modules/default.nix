{ pkgs, ... }:

{
  imports = [
    ./fbflut.nix
    ./fuzzball.nix
    ./ungoogled-extensions.nix
    ./wahs.nix
  ];

  _module.args.vpkgs = import ../. { inherit pkgs; };
}
