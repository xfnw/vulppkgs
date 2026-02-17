{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Aa54OTD3u77FqdJuxJdnh2qg4_kRBQaV4HWcEOLWICqCP5SDT0_HCtZs3eKPGKaJAs47dV1agWrkpAfe4ImUZVEwx1WGi7FASVG_BPp55dEMW0So5CAQurxYLySuWiFIUwPWAMZSmuWRSn0WoRpchpP9g0KibeMG2_UK4Q/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_215_1801_0.crx";
    hash = "sha256-V720g0QNz0fsfYc/dH1xwNy1bOiRcsjGQbJlr3dHJCw=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.215.1801";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
