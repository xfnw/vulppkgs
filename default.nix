{ pkgs ? import <nixpkgs> { } }:

{

  expdays = pkgs.callPackage ./expdays { };

  scirc = pkgs.callPackage ./scirc { };

}
