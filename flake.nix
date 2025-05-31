{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
    {
      nixosModules.default = import ./modules;
      overlays.default = _: prev:
        import ./. { pkgs = prev; };
    }
    // flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        legacyPackages = import ./. { inherit pkgs; };
      });
}
