{ pkgs ? import <nixpkgs> { }, ... }:

let
  inherit (pkgs) lib;
  walkies = set: lib.flatten (lib.mapAttrsToList (_: v:
    let
      res = builtins.tryEval (if lib.isDerivation v then
        lib.seq v.outPath [ v ]
      else if lib.isAttrs v then
        walkies v
      else
        [ ]);
    in
      if res.success then res.value else [ ]) set);
in
  walkies (import ./. { inherit pkgs; })
