{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Aa54OTBpWzzOrr_6ZecwFIF_c07wmy3e8LlDjxS7cX9_-d_d2owOHpv5-Z1-D5GZKbJk-_DMv4Cp0uRnwD1NIYDP5p_x4EL3yNXHQBfq1nk5DBPsGuCHa45N8LWxmY41R2ceAMZSmuVHvLnh2z4IH2tOLWSU9ovG6hBqnA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_308_1810_0.crx";
    hash = "sha256-8j0M4xUSmNLU4JuwHVWQWOMRHB8fN3e/mA3+E2oHPf4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.308.1810";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
