{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5j67sPIKNosP8UGEwW647mfluRWsc8ZAHvGThSkCORdq5lkmgDYwcMUXmisbyr62y2ewSOjnxjD2_M3HejF9F5t93nnUqgkvwXsg8XhOjbTxScsivGHi0Abn5aQ5WXfAMZSmuVFKiJg0NGx9JKxJkOpRMCy6WwPRA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_709_1622_0.crx";
    hash = "sha256-L+PrFPBEnL3NW9jKAQDwhxPkGYZDZLkfHLAxMZ7e0Hg=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.709.1622";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
