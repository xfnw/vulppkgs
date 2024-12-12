{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFuaAxT_GOfJJIz6a2YNs-eL83c0b7jfqcjirUnxpiXd2MrnAMHu4H8jkNEBRYBSlkCs73RYQU2BtA0abVn3uj8M75Bta5zGZ8UWkqQAKRBy3OBdXxMc9Tv59GlSwy9HAMZSmuVL1ENLQ5huux0unW9HIkU8O7D0Vg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_12_10_932.crx";
    hash = "sha256-cc+XIm2MjcMKVtk9yVwg4UT72gl94Oc1NyWfZ5r4qiI=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.12.10.932";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
