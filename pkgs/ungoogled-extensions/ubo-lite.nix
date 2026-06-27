{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcPRoerYlc2FxJSi4RQGKM_BPnwgLfo1vj6_XEizhQGAWTUpLQH0IVideASVlgMvfhsMyWrZB-zgEe2DA3-hxsEmIe-VRx-nqJv_Kqv6D_jXNO7yosRm3sLtMVSHaPwLA8FUAMZSmuUDRbFWPVuSe6DEQHwpZWPjWi4CKA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_625_2148_0.crx";
    hash = "sha256-CXPwDMq/LEslJPpsvBsEqLXKpmIb44XgFhyCDq2LRPs=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.625.2148";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
