{ pkgs, ... }:

{

  expdays = pkgs.callPackage ./expdays { };

  scirc = pkgs.callPackage ./scirc { };

}
