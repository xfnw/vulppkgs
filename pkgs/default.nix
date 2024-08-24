{ pkgs, ... }:

{

  commoned = pkgs.callPackage ./commoned { };

  expdays = pkgs.callPackage ./expdays { };

  fbflut = pkgs.callPackage ./fbflut { };

  scirc = pkgs.callPackage ./scirc { };

}
