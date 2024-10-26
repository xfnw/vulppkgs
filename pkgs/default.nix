{ pkgs, ... }:

let
  inherit (pkgs)
    callPackage
    ;
in
{

  commoned = callPackage ./commoned { };

  curlftpfs-ng = callPackage ./curlftpfs-ng { };

  expdays = callPackage ./expdays { };

  fbflut = callPackage ./fbflut { };

  fuzzball = callPackage ./fuzzball { };

  git-remote-hjgit = callPackage ./git-remote-hjgit { };

  pbcli = callPackage ./pbcli { };

  scirc = callPackage ./scirc { };

  ubo-lite-extension = callPackage ./ubo-lite-extension { };

}
