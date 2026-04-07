{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AQx-wa6aQqeX8Ck4Fj2rsARUOMfcg8A2QgLHAnRJSOR3DF3GBZb_Iab4giSFU6awE4H8D9CRxonLTlVKpb7x6mR1utCTGknJibsKN3pq_Tke5rP1cATsPEtEbqxAvC1qhm5yAMZSmuXNIy6rHeTyNtQHCgjDTxjeveVU2w/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_405_2010_0.crx";
    hash = "sha256-cm3lhHN0igWGriiNQM6Ft5CWrzzTDOhhBgA+VY2aXVw=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.405.2010";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
