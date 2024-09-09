{ pkgs, ... }:

{
  imports = [
    ./fbflut.nix
    ./fuzzball.nix
  ];

  _module.args.vpkgs = import ../. { inherit pkgs; };
}
