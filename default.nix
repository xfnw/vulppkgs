{ pkgs ? import <nixpkgs> { }, ... }@args:

import ./pkgs args
// {
  pkgsMusl = import ./pkgs (args // { pkgs = pkgs.pkgsMusl; });

  pkgsStatic = import ./pkgs (args // { pkgs = pkgs.pkgsStatic; });
}
