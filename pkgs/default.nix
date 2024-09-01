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

  pbcli = callPackage ./pbcli { };

  scirc = callPackage ./scirc { };

}
