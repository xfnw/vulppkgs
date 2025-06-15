{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5hkhe1aKpmRAScZIDZewLAB8twHdB76ek7D4UI7o7EvNYPNHGePyxoZ1KiHavDMTfgEr1RJqVuJc3ofTI9ZyUamxCS-tOYCJG6bc2beT6vvBFnH4P6knTfFoNKtwX63AMZSmuUZKrtNWOBRTJKxZPEN1x65En4Daw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_612_1428_0.crx";
    hash = "sha256-X/odncoizn/8+k/a9/iFmsfKsOkPhvpLtmqnJQLAHR0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.612.1428";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
