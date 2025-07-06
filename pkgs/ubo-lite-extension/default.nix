{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5jANVWIPGGRPSwdaUzY4fx7fu2luYUeiUozxOgUcR0S3kD5cCzHbcfJNgWh1Cw_-31MBRdBAb2vkADAuBMq1qh2X_uHmLxc64dGV4UAIssmKu7YpstOVlFvRrTrmgkUAMZSmuXHZajzbpqeic6hchTIkDP3mD9Wzw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_703_1440_0.crx";
    hash = "sha256-m0NUniJxKUBhGcBGadU2PygTv+L/TrE+8rj1KuZzJo4=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.703.1440";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
