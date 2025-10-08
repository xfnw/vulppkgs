{ pkgs ? import <nixpkgs> { }, ... }:

pkgs.callPackage ./pkgs { }
// {
  pkgsMusl = pkgs.pkgsMusl.callPackage ./pkgs { };

  pkgsStatic = pkgs.pkgsStatic.callPackage ./pkgs { };
}
