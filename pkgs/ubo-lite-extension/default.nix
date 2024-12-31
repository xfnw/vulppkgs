{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFvTosoc-gz2pVBMsDFbW-W3DWw0KYkY4E3wM3yDK8yPWFhwBCnTBJSVWGGYyBiRPPlUzLMGB02_v9OsOOTqpXqmEo8ptPuiArciodid2S7DeBCnKWDJc74hv4LCbKQYAMZSmuUeCnhla6nY-Vo7zvEEFLG7xRp3zA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_12_30_1320.crx";
    hash = "sha256-wsvOcGuyuKcMM+tbQI68qNzLKf3WpQzd1wXwJlEh2Ws=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.12.30.1320";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
