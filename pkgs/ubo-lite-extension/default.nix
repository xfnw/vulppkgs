{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx2D4Rn3juQHSJ8wJ-U7BPsbzn98pyvFkn_FH5P8Z70llYJ_whGf-gJTaDj9AWebKDj2ueX-6eTy6tE2bYuhHJypVAWNiC85_vB3FDMj0TUrbU43OpUoktdaiajtB-zPAMZSmuUcHdQNSdJ99sommcEd-9SEMy1kqw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_4_6_1238.crx";
    hash = "sha256-DMFmcW9ibSXkZuYZncNDsUn06JjAZxsFJ97GNmSycoY=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.4.6.1238";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
