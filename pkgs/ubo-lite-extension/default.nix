{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFsj6geC-gbpUmZD13EFUzPAJu9EUCQYOrYHDAeKe3hJC43gTFJGeow8IcSVeMLDsFsnLjAa-DK0-zJmt3CtU6PiBwEYl2g2W0jqOAl2UKK-kLF4fhhUOxj8NdipBFyxAMZSmuXI6F5RtUyJCiRlg2V9OaVB5EKssA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_11_15_813.crx";
    hash = "sha256-OAOswmhPyJLcjRC3oRS1biBDdxnbC1G9psOgx+Hxlt8=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.11.15.813";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
