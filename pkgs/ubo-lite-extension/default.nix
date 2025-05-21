{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AR5vvTq5aVRmua8pvBJKMhEgbcnBUq12bZjum8hNTVx7YXeGJvWCUMc_EjcBEQX-iqddXwX7fWkw--Q-RY1RD9MCN932zBxFP20kaj738ICalr03IjAuVOZz3xSisASEX7ByAMZSmuXLobH6mvIwgX1zX8dnDyXp3rbuyg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_518_1611_0.crx";
    hash = "sha256-RPeVNe9165BMyEIqEpfzfUwRqQCw6nhfq1rhUPx1uy4=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.518.1611";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
