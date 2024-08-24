{ pkgs, ... }:

{

  commoned = pkgs.callPackage ./commoned { };

  expdays = pkgs.callPackage ./expdays { };

  scirc = pkgs.callPackage ./scirc { };

}
