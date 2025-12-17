{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AdNiCiUV4eF5cR3NU564AL_BPDKVoMWgKnrcZnVim1AfpKefw_uXWUxkKTBJ-eFeNTcP12K8HoWK5GDXsCQP19Sdo8tHj5wqxaT_PN8IiZhDWogtFDpmmhmaX7s5STBkgOOGAMZSmuWxtklrqV8-KVMlpk1V260NgZ4IUw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1215_1455_0.crx";
    hash = "sha256-8SHbBt18YFHQ85zKLpQAaaWypbK1zg6BFepEWYl0rw8=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1215.1455";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
