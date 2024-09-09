{ pkgs ? import <nixpkgs> { }, ... }:

import ./pkgs { pkgs = pkgs; }
// {
  pkgsMusl = import ./pkgs { pkgs = pkgs.pkgsMusl; };

  pkgsStatic = import ./pkgs { pkgs = pkgs.pkgsStatic; };
}
