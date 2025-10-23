{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AfXM71os_qBGfm8e_erHXex3w8iiLjjrRwjjBrswGgYsMSfOgfG1otVRVsFx1Y7bW09BzaOZgpK8WuFZWoityB_YfsbwpAe7900wktDFiRpeQ4rnhMLOSwsOIXZ1RIEXKaM3AMZSmuVgTB2o9EVw-dZFtLlH6v38OWTQUQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1019_1656_0.crx";
    hash = "sha256-8QK/+KmiZrJnaeTWfa9j+fukKp7vvxFmV/4JQR3r3zw=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1019.1656";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
