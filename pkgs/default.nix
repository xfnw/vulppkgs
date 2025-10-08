{ lib, newScope }:

lib.makeScope newScope (self: {

  commoned = self.callPackage ./commoned { };

  curlftpfs-ng = self.callPackage ./curlftpfs-ng { };

  dotbin = self.callPackage ./dotbin { };

  fbflut = self.callPackage ./fbflut { };

  fuzzball = self.callPackage ./fuzzball { };

  git-remote-hjgit = self.callPackage ./git-remote-hjgit { };

  pbcli = self.callPackage ./pbcli { };

  red-view = self.callPackage ./red-view { };

  ubo-lite-extension = self.callPackage ./ubo-lite-extension { };

})
