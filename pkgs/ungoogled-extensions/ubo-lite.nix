{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AfXM71qQzPNP9rhXonvH9Im_CY49su8GW6IRTsKAG9th3vP7Jc_v2DkJJDwIlU3uTF8-_vz66msmOAd06OybihXyMkPwODnxZQ9ktvAC7t_MrwpFqPxFNGF5Bw8y1oblRhumAMZSmuVf-ztoSuWDrcI3PbxxYK6ocueRIQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1110_1551_0.crx";
    hash = "sha256-0r2Hi5qaKEwqA/ZQr3m/d6ke6EyFSt2/BSWtizDbk0Q=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1110.1551";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
