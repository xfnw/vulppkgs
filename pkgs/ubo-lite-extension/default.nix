{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5goJiCFB14MH7MgKH52oPxW__E1Zm_RGfbafO_gOTvz0BL3VU3hDE_aUJlWasHRL1cToNy_uZs83rtFtPYTmMrCQ4OHKPCTjOHmXt0WaRpjGTqZpu_fChoV8uz_XvG7AMZSmuUtrsz6DnrInnmG6eNeNhS148SOfw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_624_1503_0.crx";
    hash = "sha256-otI10QHiRCPkeGOHJ4MJD12fVrVLXRC/8kkoauUIMqs=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.624.1503";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
