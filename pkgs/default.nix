{ lib, newScope, pkgs }:

lib.makeScope newScope (self: {

  commoned = self.callPackage ./commoned { };

  dotbin = self.callPackage ./dotbin { };

  drifblim = self.callPackage ./drifblim { };

  fbflut = self.callPackage ./fbflut { };

  fuzzball = self.callPackage ./fuzzball { };

  git-remote-hjgit = self.callPackage ./git-remote-hjgit { };

  jugulans = self.callPackage ./jugulans { };

  npinsMinimal = self.callPackage ./npinsMinimal { };

  metrics-relay = self.callPackage ./metrics-relay { };

  pbcli = self.callPackage ./pbcli { };

  pkgsCross = lib.mapAttrs
    (_: set: set.callPackage ./. { })
    pkgs.pkgsCross;

  pkgsMusl = pkgs.pkgsMusl.callPackage ./. { };

  pkgsStatic = pkgs.pkgsStatic.callPackage ./. { };

  pom1 = self.callPackage ./pom1 { };

  red-view = self.callPackage ./red-view { };

  reveng = self.callPackage ./reveng { };

  terminal-to-html = self.callPackage ./terminal-to-html { };

  ungoogled-extensions = lib.recurseIntoAttrs (self.callPackage ./ungoogled-extensions { });

  uxncli = self.callPackage ./uxncli { };

  wahs = self.callPackage ./wahs { };

})
