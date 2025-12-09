{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AdNiCiWeuJWb00WU8l9IkG6eRGhN_d5xJIzEesTpTgUNNhxnyL0yKZi_IV8dA_QzpMOlCVqsjYBbCFCkDVrqzwa8OucgDqSqVVZHm8BPljk8UWqlEfMs6QRAZ_j9ypLW0LKwAMZSmuWBgS4Nf1nmk1d8Z4fWSvyJOGUXXA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1207_2142_0.crx";
    hash = "sha256-6lDz/PE/GXt3rHs/MDIdYEcp+g54r70yPP8P8orItq4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1207.2142";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
