{ pkgs ? import <nixpkgs> { }, ... }:

let
  inherit (pkgs) lib;
  bs = p: lib.filter
    (v: lib.isDerivation v && v.meta.available && lib.meta.availableOn p.system v)
    (lib.attrValues (import ./pkgs { pkgs = p; }));
in
  bs pkgs ++ bs pkgs.pkgsMusl ++ bs pkgs.pkgsStatic
