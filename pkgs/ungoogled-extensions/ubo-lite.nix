{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AXJDbcDcO25KiSIfoL7iqhqhmY3VVfNZ0WyMCCx1LInxHsugyDrHpLhE8MMy35sTeu3OcjU2TdavfnIWRnWAnEbL8mTd5KltTv8zYCnV4V_UHw4H2JXmdFa147S2iEsZa4ufAMZSmuW998kY6IIAcDcyLujnswpcVpagKQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_426_1536_0.crx";
    hash = "sha256-TGq6D+emNmIS1Cu5p2IcXkLKvaznD09pbvDha0sT7u4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.426.1536";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
