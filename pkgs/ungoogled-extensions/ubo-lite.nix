{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AQx-wa46CPJFzgqSDy8Z8ejLu6cP1JdTKXjSXRFUjxSc3TznJQj4WBmcnpxoUMjsiormmbOs8cBnq1H_PsYiPFS-F9MZUa5guySFamxBgAxO9Vbji4c92cQu6k36sK4UolcuAMZSmuU-ZhSAIt7dfxaWOYHeiwEsZCcXbQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_329_1951_0.crx";
    hash = "sha256-mwq2ydJZmcihBR9ClYvbsOC54NDPh+I6tMd2pkXtHV4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.329.1951";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
