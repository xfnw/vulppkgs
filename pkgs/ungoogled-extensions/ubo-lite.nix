{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Aa54OTB_3UCOWnh3XYE_WZCSh-VBaOy2NGhmBemiiLCwRjg07KEvjZRH5ctU5U46uhZGfK2xk2LX2dGu8J1TfAhG7ERIUm2TVlXFdPdVJkCAtAQ9Y8ieuRkbaDDbYmMiH53MAMZSmuXy1fhDIyfien454LvsHBzdDhcQ9A/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_301_2014_0.crx";
    hash = "sha256-Eov/dQoZTRK6SljyBo/j698AQLpI/yn+W4Fp35k+7SE=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.301.2014";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
