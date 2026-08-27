{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL5BOZ90OfUJFywf_O_PNpnh8clavbinRSi9jwtBfMSJG93kuOn_3c9moWQAnXDADQ0JRZc73Ud7kpP4BhVgv_oorZk9NCDsc2gDT2igXdqFfv-2IjEOVAFDjU61xtrSAMZSmuUcWvwDfmyMFVwpKL-cmOUuKaKFXg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_825_1619_0.crx";
    hash = "sha256-QrYLqJjMtC6rke8CAoz1xqPwKuoUMDyvEZl2+X7Nz10=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.825.1619";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
