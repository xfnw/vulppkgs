{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AdNiCiWrNZR_c10XDBF7I-JdeCkgkrvEfGPvOPgBtQx5cBlaSSqxiHSWfFITdCxFSSjbXyjUTez6Unk4PubPJxz64HZT4_N7YMiwP_7XXYwegw4egaCle1tNggsWA3qE-d_RAMZSmuVi2YIRuXWAkW6Dzeyf2IJSfzekiw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_104_1656_0.crx";
    hash = "sha256-kKRO/y8MTdbwIFeVSgAN+bYZLy9f67bgecp1khkhZ1k=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.104.1656";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
