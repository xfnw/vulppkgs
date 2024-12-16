{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFuX6Nu7Is5X30VuQkUtj42m2JJtOBP_T4a122Uj2DI9qFLpxiu4QC2B6r-rpV_Auukg4wPuahUz3utLlvW8xshGTk5Q3oeSvTnOGaOA4hHv_xlDk1to8Sa0m1GZSNv9AMZSmuXCkTDB0jWRtXX5mYHrPFYzG4oPnA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_12_15_1269.crx";
    hash = "sha256-v1rSNdLRai6GtO+LXeQYuTH+xYmR/4suPVZXU8aHkHY=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.12.15.1269";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
