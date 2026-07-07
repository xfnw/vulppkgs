{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcPRoeqJYuD5xZ6iGlTsVnqmPn0BbDgMl10Qnf-PHxxksaYzwH_yuPgsF6cjhBCeXRBbpGgBzpYjk6e7ANYdLkblQYGLy00mjHoAOUYCYm5JHGMdBv1-bDWvTDscDeweDZZUAMZSmuWfx1D1a3oTQCmWrFdRpkOEERpaVg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_705_2152_0.crx";
    hash = "sha256-LL1SQMAKPGLBrN8nhz2rCq7fucKa4EsaeE54jnVdNN4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.705.2152";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
