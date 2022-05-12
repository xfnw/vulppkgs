# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  ep_scrollto = nodeEnv.buildNodePackage {
    name = "ep_scrollto";
    packageName = "ep_scrollto";
    version = "0.0.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/ep_scrollto/-/ep_scrollto-0.0.6.tgz";
      sha1 = "6b57e2243cb8477e1437c348a94cb6bcc162f91d";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Scroll to a specific line number based on a parameter of lineNumber in the URL IE http://test.com/p/foo#lineNumber=10 -- Users can click on the line number to get a link";
      homepage = https://github.com/johnmclear/ep_scrollto;
    };
    production = true;
    bypassCache = false;
  };
}