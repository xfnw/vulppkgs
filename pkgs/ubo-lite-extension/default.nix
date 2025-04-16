{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AR5vvTobvbfXDPLb9nXF8HzOB7e4f_PR05UxwQhJeQVydEAyvER2c_rf0_zmeYZXuuqZ-sdsEsIXKmlqZJ0wPxbGCxZyogG2z3j3vvIOL3-yarKOddiYG-_FZlTaox_zHGxTAMZSmuU7-5PHzLPjJ0k2vATSRe0SRlFDyQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_4_13_1188.crx";
    hash = "sha256-5Gj8GZUkyh2GKHjQE2NS6xfSRIE7mp+/80DVl83p43o=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.4.13.1188";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
