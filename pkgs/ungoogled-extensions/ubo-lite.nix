{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AUU14H_IHT4CHVih0za-EbQ0S28-PEH9Q8B2oEw4Bfh0KuK3WJyPbLcoe_Tr07zUM3qZv8rhHjxkXSE3AThee2dOdfiSEt9Glt82zw8WsVLFKiVcZU4KTj1-RMJfYyY5M1r4AMZSmuVjEy9xFy3pqV8KCTvzwvPtREQVrw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_711_25_0.crx";
    hash = "sha256-u40HfzbBmhvVA1kbRJxfxGeFjk85bT4R5On19BG/xww=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.711.25";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
