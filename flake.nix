{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.default = import ./modules;
    overlays.default = final: prev: {
      vulp = import ./. { pkgs = final; };
    };
    legacyPackages = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "riscv64-linux"
      "x86_64-linux"
    ] (system: import ./. {
      pkgs = nixpkgs.legacyPackages.${system};
    });
  };
}
