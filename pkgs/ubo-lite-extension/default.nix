{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5i8YLSxZ7lnMOd08dMhmM9yyo_rBtCAflYvaeaL_teXzFppQNWL-upxk2P12gjEMLRx_JD3t51gR8En2RDahslYYncwsJMQa_UyorIyoyJ_ZuDVSYu415eAq2JdMK3OAMZSmuWKgVEtLof6z96qcyasmW4a1w0c0w/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_817_1539_0.crx";
    hash = "sha256-fnJNEiNXih+UNnbhBBzctuo3+pnff2NkIL3Orrg5D2Y=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.817.1539";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
