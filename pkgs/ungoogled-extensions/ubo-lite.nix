{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL6P7VSI7cEtSUD2BWNa3KutONEq5gjjekHKZLpRNykuuFCm9GvVLTtml6vPS445A7qZCUKdt2FWsZdI1rJfh0iFX_ufmRz35OewYrt1_R0vqBYsCNzmo62rbwIx_auoAMZSmuWFwe3DYC-lII_NYiinFBzLBz6rAA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_819_1210_0.crx";
    hash = "sha256-5RmujSTh/pzowWrcr4+/W41R3NUHcP0+MEzz3sZBaKA=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.819.1210";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
