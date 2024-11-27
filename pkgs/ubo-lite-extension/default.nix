{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFuHmhhzmbZMdTjUtNgYGA91Q6EunDfSGqkJ8BuYZy5y-mvCaqHb2ykv-ISjkXBad_rqbEOtJu15MwQ9kBhU4ZXfOKDw19JvFfqYLfve3lNFQvBGUK9H-pUcQgmcsYtwAMZSmuUB7SSBReQCyOsKfArTI2b5dSTlsg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_11_25_1376.crx";
    hash = "sha256-fi/atHHXw5cHiWy4kKjstXYbTogPC5sQZYNtFAMjKcw=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.11.25.1376";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
