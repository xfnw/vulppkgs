{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcLY-ySNt_7a6CFSUB994G_xJKKPUx5JE1brbyEaLhhsX0R9jz6SS5VuZRtQKPUMlJu9QxgBgcfB6lRynifp5x0PV92Z2tGsEzp4hlqCN8wrDDeVWPstfAalWp0c1KRnKSclAMZSmuVF2TU451mdQsusqcvcrdN_OdrKjg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1002_1210_0.crx";
    hash = "sha256-ay2JSDo/lOdcm4bW/vmqwJ2mOC6qMQzkFC+0j1xjzy8=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1002.1210";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
