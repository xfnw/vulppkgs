{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFsMHS3T8Kxqbj-EfoBH7xOSvadBI9gZjOpfCo40oCzH6hoPaQi4wmV5_lNl9Bm7BLviQxSjBWhlV566TZ7sPb-WWwK6qpWEGwQ7i1GWC-BTmjhM_INMYlhysk5UZ_9iAMZSmuWY8WLKQEbaPp_32SpapVmszZ9hXQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_11_19_1126.crx";
    hash = "sha256-Z50d4QI2Q58PdB8vuGILLXantZxLYCMQtRJ/ZUfZELU=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.11.19.1126";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
