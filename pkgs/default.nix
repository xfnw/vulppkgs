{ pkgs, ... }:

{

  commoned = pkgs.callPackage ./commoned { };

  expdays = pkgs.callPackage ./expdays { };

  fbflut = pkgs.callPackage ./fbflut { };

  fuzzball = pkgs.callPackage ./fuzzball { };

  scirc = pkgs.callPackage ./scirc { };

}
