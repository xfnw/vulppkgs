{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AUU14H_J1OlBN4sy1MQ4rpdV8NdS1A9aWOryNteh2zqD6D4VyeEwBr7vfB-gUMXM81ZJ1GlzocuLtNfdnY-P9n1GE_PW71hjeQx3Qm88n7OgYaqpuc-aJfYZA3Cj8-H54ZSPAMZSmuWdXr4rIEcpWqtsF1bMo0xp-37giw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_804_1652_0.crx";
    hash = "sha256-6BedbWtwFls3USelAzd2ik831PiskVb4eM0FoPmtELI=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.804.1652";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
