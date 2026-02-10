{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AV8Xwo7Op_4CASt7bKQ2FruXBTafdxai8kJ8gHh0QzJ_IhWb91fwy0bAKFR3cUebT_YZTgpbaNvPSx_JZpysqvuK3SOUp6PpAxn4m7rrZnKPojI0eWAGwQQMTyF97NmFHyBxAMZSmuXH-rT7NzqUYdzLp1RNZRfae18uLg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_208_2004_0.crx";
    hash = "sha256-qVx55Xhks4M7e0JijTe/t7TvmAkvg/DxypmeqsLd1Hk=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.208.2004";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
