# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  ep_timesliderdiff = nodeEnv.buildNodePackage {
    name = "ep_timesliderdiff";
    packageName = "ep_timesliderdiff";
    version = "0.0.5";
    src = fetchurl {
      url = "https://registry.npmjs.org/ep_timesliderdiff/-/ep_timesliderdiff-0.0.5.tgz";
      sha1 = "f8e0543677f7ac643936a2afce9f370d08a43310";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "See a diff view showing the changes between the latest pad and a revision";
      homepage = https://github.com/JohnMcLear/ep_timesliderdiff;
    };
    production = true;
    bypassCache = false;
  };
}