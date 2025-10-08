{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcLY-ySd-RGKGq_-FZyOpjgnQId847tks3491h8vOEu0WwaJuwgwv4_2Exc1xWitQwIBSBQnSmndWi_ZVaWGFVGUXLsSDRYdbfyxI7nz9zGd6fPGVb6_xY6facfhSalbV0hVAMZSmuXWCI3hDpL7w7D3sVqaH69yXL6mPg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_928_1920_0.crx";
    hash = "sha256-66QCGJ+A+CzMAqPitlmtIH8Se+CZCAEbWFw6hjYfbks=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.928.1920";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
