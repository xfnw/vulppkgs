{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AR5vvToUznjd4HPtq2Qf2ofykf5cygX6Wm7Q7cmg2zGc61WE49beD-vBuuew0okjXIj8lJ8TJMfGenI2Dg8DAJT_dNWWaFrSeW5UApwk5Nxh05G5vVNqQYKOcrQeYkJ2fxBgAMZSmuWEL6hqLeWkBX6RZY0yRQi9IjkaXg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_512_1008_0.crx";
    hash = "sha256-yv2NpQY1JKz1eNk6kQglFeOuMUsdpgXdvVKREcbA1Ho=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.512.1008";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
