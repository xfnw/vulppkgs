{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/ASuc5ogcZQ2eriHe6H-0dmZTJLxkLMHR_ugkklXw7n8YV19lxG9DUoT_bx9ihJRcDLYHJfYnj3CJsx5jeaZUIperwcWtEuWWi1KalOE6On7rBWAmtRCpDDwb1E7cC06qhWXwAMZSmuUsCshMmis8wkyPpSqxNyq8rZQ-4A/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_2_23_1382.crx";
    hash = "sha256-XeY8LcpaPmGYnhGBxVE8MI2q7BNcHm7NvYHG8KK2Gdc=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.2.23.1382";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
