{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcRzI5xDuYpVMnQcRRqqveeYLeBXaeti5PH_X65PWUdofm2qkq5-FFr6Yd-8ijMcmEw-QYjR3hPaKEEeb1qb_7Bt3L0Dht2f89dYHiecRNpq4_TeCKLmE9NU65CAQ1b-AMZSmuWWO6d9SwjSR8VdOlVt8qPe5B79wg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1012_1545_0.crx";
    hash = "sha256-3mfAj496M3vILCzIZCPuoCQ+Ar4/072eKJwgyC6tsko=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1012.1545";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
