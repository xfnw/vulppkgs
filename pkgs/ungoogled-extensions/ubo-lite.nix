{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AV8Xwo6tBAFnKBWJxrTU7jfqnSJfNVeF9f1vpdcH2qbAUPRLfbK7QizfRtrfKQP53ZV2DLuLpocuzH9QqNBw-vzAF275O8CdDjknmxzOcWxwJPE61PLNdWTvaC4rAOIYuK7sAMZSmuVMGDUGWSIRNO8FlrWXo0nqUyXs_Q/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_111_1925_0.crx";
    hash = "sha256-Vv3fvggdNDeKf8zGDddwPImYq+c8f1FXZ2IePxtOkM4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.111.1925";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
