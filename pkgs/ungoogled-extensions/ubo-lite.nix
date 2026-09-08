{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL5e1fZU2OpNGdQrybSxu-RBDxAlGlyq6IjLJp63HyW_YmWx1TEzYKJtYQXPGU3-wbGZnJJfjMpZeamvldio9zQQEMVmDEdpQStAHwTw2GQ6f3enr--MapVl9nkGIaGDAMZSmuV1_UXEN-qe-kxCcZGtQOkF2gyIsg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_907_2003_0.crx";
    hash = "sha256-okl9fSIeWKqOiJwuQyPgVP2O/FVaSunjwQECBW/Lqx8=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.907.2003";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
