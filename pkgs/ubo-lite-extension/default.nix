{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFs0gW2hBjdvnnHTydGAAEy_7580sgDkuxVELZlS0FsGFxS3YRAurbem28QYBY1A1Lofl1MhN9zKPR_ST1ACfXqLK2G8fpFP4bVGp65aRH0hejXL43K6zrIOopUzpEyGAMZSmuUhLlRNHr1mD9XnLBCEj9lqdVU9nA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_12_2_22.crx";
    hash = "sha256-rFlND2/6eye8ZI9FSNRLebPR0ZQ2f7zZDVQgS3rdc+0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.12.2.22";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
