{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AUU14H-WmxygTsxFFOV3oB5ij3tfrKJefDYhM7YeHo4ieGynOkNZEoxTw72rOYH51nig7YBtUUlCXiOG2hc0Q5um8biI9JiV145LnsOu0elBTGjoPBMw7hrcGgV50yeXNGu2AMZSmuWLcH11QFEbn72Fw4tz4q-m9I81nw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_812_1211_0.crx";
    hash = "sha256-QjPIOwUbfw6Is8GiL+FjiPECqg0ThT/csEViJH4E1W0=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.812.1211";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
