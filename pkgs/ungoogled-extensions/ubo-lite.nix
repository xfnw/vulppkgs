{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AV8Xwo6QVzlz2A3mAffy-TkCuRW_LPd3G00VcIfSS7N8WUDdbgaXPaTJDZgUuo804yxO7OLbkT49tDX9R6yLvBBcWtMBdULMJzkYOHiflmSKah1mbZAzIy6Mm5DDwkYNjFJ-AMZSmuVZ_yg0WUe4fUDIKoAkdUwTAXONMA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_201_1924_0.crx";
    hash = "sha256-hQfTXJxpGVNtWcWyPWm/6BrnxU99g60gTjvtZTyMn80=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.201.1924";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
