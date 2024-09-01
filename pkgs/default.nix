{ pkgs, ... }:

let
  inherit (pkgs)
    callPackage
    ;
in
{

  commoned = callPackage ./commoned { };

  expdays = callPackage ./expdays { };

  fbflut = callPackage ./fbflut { };

  fuzzball = callPackage ./fuzzball { };

  scirc = callPackage ./scirc { };

}
