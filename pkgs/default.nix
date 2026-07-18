{ lib, newScope }:

lib.makeScope newScope (self: {

  commoned = self.callPackage ./commoned { };

  dotbin = self.callPackage ./dotbin { };

  fbflut = self.callPackage ./fbflut { };

  fuzzball = self.callPackage ./fuzzball { };

  git-remote-hjgit = self.callPackage ./git-remote-hjgit { };

  metrics-relay = self.callPackage ./metrics-relay { };

  pbcli = self.callPackage ./pbcli { };

  pom1 = self.callPackage ./pom1 { };

  red-view = self.callPackage ./red-view { };

  reveng = self.callPackage ./reveng { };

  terminal-to-html = self.callPackage ./terminal-to-html { };

  ungoogled-extensions = self.callPackage ./ungoogled-extensions { };

  wahs = self.callPackage ./wahs { };

})
