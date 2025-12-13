{ lib, newScope }:

lib.makeScope newScope (self: {

  expdays = self.callPackage ./expdays.nix { };

  nix2tcz = self.callPackage ./nix2tcz.nix { };

  pushimap = self.callPackage ./pushimap.nix { };

  source = self.callPackage ./source.nix { };

  taint = self.callPackage ./taint.nix { };

})
