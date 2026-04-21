{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AQx-wa6Jq5ezMnoGEhQyq6monGFv8tXf2_LP6LEaKC-fDK52mAbE2LfxY9Vy81_T8mNtX7tbKKudRL6gLt4aSYm8C5CWn0SVSjC1hd0j9Qc4roHA7eK6ow10OTxDYy-EQZZUAMZSmuV8_iEU8VOH-V3fEMnJph6mU-XirA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_419_1519_0.crx";
    hash = "sha256-+j+xkER0ZrkzqYdCURxJiTNKUgWl29iySdVdhgmzqus=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.419.1519";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
