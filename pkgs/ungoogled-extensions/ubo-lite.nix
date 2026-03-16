{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Aa54OTD_vlvDD2nyoiz79pVK_UUhtk4L-3Hrq14x5Rlgu6duoLEBH7NES84Fg4zh0j3pYxBYwiIw8RrPV31FYmS0F5dSUCBQe6mE8-bG0ZadO0nqsH5x07JZaPsx_aAoCvTMAMZSmuXYBPV5LhJIsjtbqimzcv7656vFGA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_315_1814_0.crx";
    hash = "sha256-Z87OigYRWGlemEalmoeN0f/DlT3GlsRMGqSdWVQqnVg=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.315.1814";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
