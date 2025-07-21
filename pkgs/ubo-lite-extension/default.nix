{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5iE-M6TItTaTXJh9EXKSyjWq2mSeuahHtAGVwq59meFfhxfcqmMyn7rNMZ4d2C0nuYBENN2kGGFUosvQxIYZ8XOlxZ92-pI9AagYLxJn-MC5JV_frTg1L0d-FTwA8fRAMZSmuUOrwey9fZYtQ040m4GASY_p6YWdQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_718_1921_0.crx";
    hash = "sha256-Fnt9fjiLxhSuGNcMzE7+ZpAFaUphRPixi1XbvkHaL0M=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.718.1921";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
