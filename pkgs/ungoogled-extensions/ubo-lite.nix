{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL5-aIOPXysaTzfChSeofB9s9jqpN3majB_vH542X7fHeLHz_De6CCPeN4ShRoV-HG-Tdq0NveYbb9tHNGOOTpdgxGv5cG0NlN_XPQIfs9pUzQKZzcAcbBsiX9439DsHAMZSmuXBSSRT2mNKZCSIWziiMhVMqA9uqQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_914_1325_0.crx";
    hash = "sha256-O3hFq2zV7SQA98/W5FiNea6aPgCxgWfi701TrQV3Xtc=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.914.1325";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
