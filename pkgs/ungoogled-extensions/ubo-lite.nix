{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcS_jEQr-NpRvwrJvCHv-B0OQ4wEEsb4PcN4h34C_F7sw24EEcUoAudWJIu6OgMeR18JuqfmUkL67Bhc3qd_kE1G5Mi1oAbm1SDMBL_OrgtMXcQ-UP-nJV4_LyBfGz_JAMZSmuUHBqaSiVJTxCtzrfZRwpgEyoo3Fg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_930_1227_0.crx";
    hash = "sha256-xQxWiobgAEck2A4wIRO6inWIeW2SBXUIxCg0Vgmqhfo=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.930.1227";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
