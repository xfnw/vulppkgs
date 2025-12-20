{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AdNiCiVU9oMwApd4V-afCwtQibrSR3iTW9MjmAXL2kR9DLwKHiSMMzxS6LZdoroqjcDPZnE5OeEF_IblWmPUp2wtJXcRfKjdd0SHQhhKSW3WUT0GdeKfCTX5V5Mwo6xjC-bYAMZSmuVI_jOlHIZZEBWNFIuJ5H96uWIfGQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1217_1755_0.crx";
    hash = "sha256-H/MqpccHKdkRa/h42DQI9Fot9Io1w7Dwxvs+HvXgmGs=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1217.1755";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
