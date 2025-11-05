{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AfXM71pVsJ1XuCjyBrI1Vy--qaIXgsOM2GxSeB_P80IHSVZXW7tddS9m1OfVV931XEmbuAiM32TJiIkADq4nDJA6Z9B8PGHNg_nH2fU-d-vIwsUeuLbBk9cY3wEvDqN_lKbtAMZSmuVBGWc77y7Laz-YTlKqThi5MXDTuQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1104_1637_0.crx";
    hash = "sha256-HAZnL2cj+OZgYc4UIpCJ09JcwtdqVNkpVjoSIrqdIGA=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1104.1637";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
