{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx20-amuXtYstnVBa9jugOnW0HpJAiR7sm0V7adhWhad7_luVyERou7YQ48xk8hu1MtPLsvydIipSv2MqF8tvacqjJqgXvBKnhqlxRU96QFjQ11H6NHNYyvS7SmWz-MbAMZSmuXXHpo1OsxGPpkUXxIMtQfR63WIBw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_3_30_1290.crx";
    hash = "sha256-Nl431lrWp5uhDXhFqEy/u8pkcnI0zMN1gt66i3FPhl0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.3.30.1290";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
