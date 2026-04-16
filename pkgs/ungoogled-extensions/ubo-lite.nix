{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AQx-wa4fWFKBvwIuymKClZWNsr7NlqSiluvdgqhqxYAEflbrY3S9qxDmwFDicNJAwbUNLz8l84TaeEel4ySWD1DAD-lTr3lULTHVjpo3NsGkynqQJruRnzq_LNALd4lRKDzkAMZSmuV1dKWLkkAJ-Bfmy8-rooEyydr1JA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_412_1536_0.crx";
    hash = "sha256-hf+xuaSwsNU0w70TrSvm0960M6+BmlO0J+IrtymFVvo=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.412.1536";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
