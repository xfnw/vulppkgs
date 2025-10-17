{ pkgs ? import <nixpkgs> args, ... }@args:

pkgs.callPackage ./pkgs { }
// {
  pkgsMusl = pkgs.pkgsMusl.callPackage ./pkgs { };

  pkgsStatic = pkgs.pkgsStatic.callPackage ./pkgs { };
}
