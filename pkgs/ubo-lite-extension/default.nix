{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5gPOLqlsnD5m0Yb-IO_DTCq9aUWvET6xILoMkn92Pe14OjCjZTWYgMPTzZIY6qRScu2zT3lvzBrod3kEu_b8oA9_M3Mg0_Sy6Yok57Sa7HYatZP1Da4cU4FBFQv2IMJAMZSmuXs2oVyRRiHeQjcPVdoUxRs0x2UNQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_812_1339_0.crx";
    hash = "sha256-otzJ8PqxW+3rFrNvElwtPwJXjngQwnFi7R7gcrhoOi4=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.812.1339";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
