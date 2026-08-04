{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AUU14H-_9pMj6NlZzkNXxF25tZYX3KHp1cJOhkj4LWxtmyN-5YugmCjv6pKUNDcDL2iUvvDoWZhFfZbah4sT68nkIaauYBYiP1XIvrReRFviVu4np-x7x0PKa_sIavYqoNMGAMZSmuVQxxQK5MUJc2swuUXw9qV71zSdPA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_729_1529_0.crx";
    hash = "sha256-w6XUWHCIumsa80bE/u3Q1FJgOHzEN8Tv/axLfMaiJ28=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.729.1529";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
