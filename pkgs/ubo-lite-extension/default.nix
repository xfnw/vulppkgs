{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5hHpWbtsP2Yhgl5KcQmaGz7zP8lkFfalRaaRouNaMX8UEfFyc9Jy8rnH9ESqhohSxAghLv7sGIYclQDZUygKxoO5Wt8C9e85L20qJx9aJ1Ewr1wx6OPVjpnXvQjKf4nAMZSmuXGniSXYH9etkDdfANeC6HIy8nG1g/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_818_1918_0.crx";
    hash = "sha256-9cxFbWcbAQ30s9GKDae6V97SbFpGxYWPX/0G2nKwFG8=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.818.1918";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
