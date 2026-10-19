{ pkgs ? import <nixpkgs> args, ... }@args:

pkgs.callPackage ./pkgs { }
