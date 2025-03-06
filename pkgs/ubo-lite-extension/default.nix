{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx2E4kpaTC0N3M1IsktzILweieSt38aAVDtHh9VhTKRLfUvr3D1omh8nSjxT1UNnNc2LcksgR8NtCWHDlztcofjqqCfnB1WPjf3_CrKFGjWF1qOwUJSINWniXUK8RKh4AMZSmuW0iC-F-O4wmQughnbsZR8gaM4Eww/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_3_2_1298.crx";
    hash = "sha256-E3O4K5Up0YMXtyfhKU+zcfObYIgp4KGhEKQvTQNvZ9o=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.3.2.1298";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
