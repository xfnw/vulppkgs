{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AV8Xwo4qLVWvKFliRS7yh8B9zKYA-XIOqUuuOD7DwICaSwllLN0vteE5SDONvX3_m4Pzi-QLEG422E49FE9EBLyig4DYSJzGtsfB37STirt-OuY15W33SLjGyvaBpjx6QUjrAMZSmuUM7CU5qgvy1iwSyqmEoQrU-z6GJw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_125_1931_0.crx";
    hash = "sha256-wKJU2UTjoD0+2wWGVbkOXUrxQqaGGeLGF8wRXhWRtl8=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.125.1931";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
