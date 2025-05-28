{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5jzXN5_X0e7_Nccv8mV01Dsu71sWHohKPMNF0Bq33o2wbSFluc7FxQCImU048esUIENBsnLxw-nZVh7iT6Is9FBnZlx6P0K2f90zgYqjjNIjBpqy7iEpgayiPdh1H67AMZSmuXtXjIE6_kBpJCPHnYbWAqokniP9w/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_525_2314_0.crx";
    hash = "sha256-0v4YEp4xKkbgaXD0c2HLlvUNzjoiVxJXMiOUXobAibg=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.525.2314";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
