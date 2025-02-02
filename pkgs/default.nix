{ pkgs, ... }:

let
  inherit (pkgs)
    callPackage
    ;
in
{

  commoned = callPackage ./commoned { };

  curlftpfs-ng = callPackage ./curlftpfs-ng { };

  dotbin = callPackage ./dotbin { };

  fbflut = callPackage ./fbflut { };

  fuzzball = callPackage ./fuzzball { };

  git-remote-hjgit = callPackage ./git-remote-hjgit { };

  pbcli = callPackage ./pbcli { };

  red-view = callPackage ./red-view { };

  ubo-lite-extension = callPackage ./ubo-lite-extension { };

}
