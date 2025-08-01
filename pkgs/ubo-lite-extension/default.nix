{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5hPQ1cT1QaAsnADXyad_aB9ne0njzFvLBzjnYFVD9W_Csbt1bonFqn5LXt47d_bVbQjhAN4fgQv3W95V0_ppIHUvjzGzaJRlMAEZ5M5mpqoOibc93_yuW-Ww75gZPzPAMZSmuV7dlgl1J1NtbCh7_gMkleSoh0Y-A/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_728_1406_0.crx";
    hash = "sha256-4FUhpGwZXUz2mLvzTlR6e6Uy4DQLsLoI5GCzWb5PQIE=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.728.1406";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
