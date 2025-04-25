{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AR5vvTpupePZ-knSyAmuGloOAKiEGzosqNTkFNfZ9Jf0DvAjWPBR-Q90i5TuX3pHp3gYNAnXMtnUbBpz9mjw9j3kMnXrh7I5vFKakutJ8xE5VwEMLoUfiEIUHwAtVa9Cq7eJAMZSmuVbnkzWd_fLwQQ4NJZJ7IxsBlrVhQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_4_21_839.crx";
    hash = "sha256-cMCaKVROH/8oXtIZ4105BbZhaVhKk+IbuYfTSYchMA0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.4.21.839";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
