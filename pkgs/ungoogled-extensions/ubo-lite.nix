{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcRttP43ADZkfqW1gH38eTEBEqH-XbAWUCDTNsKWoMH7cDRCnogw6uv-37JmSnB6wqT5L8j3B4tcMEEc2-UgRS4T8MTBH_upiWnUuwzQFRsdtCbNOXumcSJE2KvNFptlAMZSmuU3AyGU_4bpdLdswT3PfyaHmHBc-Q/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1026_1812_0.crx";
    hash = "sha256-Z2P/MMt7ib87QRkIwDZ0tdTpjBKjj7rndv0FfRqNGDc=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1026.1812";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
