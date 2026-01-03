{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AdNiCiVfXyUeM2A9AlICYenLOMysf8Jf11MXB3G06Qhaz2YAfsHLRa1le9eb016ApWoTZ9PkVP3bCxAJu0iA4R1CsRLeQVikOG1ZVWAjrVygb9EujlO5n8S-Tq400E2pc37AAMZSmuVxuNED3iBZ3KNgspJs9InJG8Bu1g/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1229_1729_0.crx";
    hash = "sha256-rn/kr3p2xSgcsVfvZshbiXijn3k3Y1eovEeFrPzV8ik=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1229.1729";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
