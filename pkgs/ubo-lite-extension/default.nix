{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AYA8Vywej4pSyVSwRCTZweKqVB3cs2neMjdUP1ZyV-fnniPH5j3mJ_SSMsdF3yhzmXmrUt_7pym_Ga7M5aZ3P_zbdF8BktgkZGcUJJLJC7979OTXJbp5kmX6ZZrJwvsxoQcvAMZSmuW2EQMnm5GSQmnNgbNmJMq3FvZpVQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_10_14_189.crx";
    hash = "sha256-4MqKLl1TFErBco5O3GsvJ4Vh7A13XbSfUxWmHSQrh2A=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.10.14.189";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
