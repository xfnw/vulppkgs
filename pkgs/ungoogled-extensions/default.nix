{ lib, newScope }:

lib.makeScope newScope (self: {

  ubo-lite = self.callPackage ./ubo-lite.nix { };

})
