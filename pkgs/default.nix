{ lib, newScope }:

lib.makeScope newScope (self: {

  commoned = self.callPackage ./commoned { };

  curlftpfs-ng = self.callPackage ./curlftpfs-ng { };

  dotbin = self.callPackage ./dotbin { };

  fbflut = self.callPackage ./fbflut { };

  fuzzball = self.callPackage ./fuzzball { };

  git-remote-hjgit = self.callPackage ./git-remote-hjgit { };

  pbcli = self.callPackage ./pbcli { };

  pom1 = self.callPackage ./pom1 { };

  red-view = self.callPackage ./red-view { };

  ungoogled-extensions = self.callPackage ./ungoogled-extensions { };

})
