# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  ep_set_title_on_pad = nodeEnv.buildNodePackage {
    name = "ep_set_title_on_pad";
    packageName = "ep_set_title_on_pad";
    version = "0.1.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/ep_set_title_on_pad/-/ep_set_title_on_pad-0.1.4.tgz";
      sha1 = "b89b354242509c0cc825b7532de505a883bab2b3";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Set the title on a pad in Etherpad, also includes real time updates to the UI";
      homepage = https://github.com/JohnMcLear/ep_set_title_on_pad;
    };
    production = true;
    bypassCache = false;
  };
}