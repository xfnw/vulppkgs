{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AR5vvTpsCJLTOrS3hNDfn8Ypm_aM7NoTPR7q071sHj8CcUxsytEZRCqJ6LgIn9a84lBD46QPT6XZGpqWa99kDM9J7pNGkZRMjjqywVe19ASzSbZ0Ir-kUn-R1sUno2HiIU_dAMZSmuV3OU_W8O2d3H_gqsrsrxKKLAF5_g/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_4_27_1394.crx";
    hash = "sha256-4VSdcRixg0rO/c/QiRD5gQ9lZKjZ5gdkOzApNBR3tx0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.4.27.1394";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
