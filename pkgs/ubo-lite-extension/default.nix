{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx1pORyFA5TIPcXcbBgCWDo0ggKehMxQEImGwVQ68E3-oVIj1U8Xnx_EmJyNv508stMeMpvMC1H3iNNn4htMrEC_f4gjaerSM6ATM3rD_GoJOtXHeBBDWn4WZ4sptyAAAMZSmuXTCLMiiyQEaLg_QoQ6K5YdIsCj6g/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_4_1_700.crx";
    hash = "sha256-S+DrA9N7lycP/0/SgJPSFBX84OZNq2n4YDPv/uIsyfs=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.4.1.700";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
