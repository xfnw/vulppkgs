{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL4ivepYtQK9xaDnPa9AHNl5QZsx24qAbQifgFAXDAdvyJgI45L8vrsKsrpa1BSD7kd0dV4Qzg7yPw8Tx41YHEzrYaJ4Ruktoj2Q3yQJOxqwrb4xX38Q45M-s5IqxEcUAMZSmuUeP_hxg6KuWBNm9nEteS1YxgRPAA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_901_1442_0.crx";
    hash = "sha256-yo800GVq5teI2/k7Izp39wywxGc2gRTd8G3Qb+kpDpQ=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.901.1442";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
