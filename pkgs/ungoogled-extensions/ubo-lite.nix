{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AV8Xwo4dVYCl2S5UuGN0If1-1p1rYuSlPShCscvPeLuk-PdiRrwRjrg5uBh-xU0xZkCOk9jucZNDImMRA3fidIONrLTPenCMZSEJpepdTyVXnh7h8T2sS8BiD2AHox-h-zKaAMZSmuWPspz2rpHmJ8LbCLa89jA4l616TA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_118_1828_0.crx";
    hash = "sha256-LvzjGKrJlFsUt8HtrKUbHMcdJOXLRv7hjrbNsW+UUxA=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.118.1828";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
