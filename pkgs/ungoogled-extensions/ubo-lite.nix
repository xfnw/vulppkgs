{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/ARGaeZJQkITxzrVcTdVAijadlhafrQbvDuyuajde9HxAapvNBOGwVPrZ31mtd2KytDg-6tZAHHhcpjxOB3CepxnJbhcEqRZfcUmnHoMCIzNnYVpWOfAllUq6E5GdBNPYIkjGAMZSmuVu6YW24Rnd3CmLq6N0xoS2nAkI4A/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1103_1743_0.crx";
    hash = "sha256-spD3fN6TARbPbRXIlCcJcgStSolYKBoJBhnfSc92Dko=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1103.1743";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
