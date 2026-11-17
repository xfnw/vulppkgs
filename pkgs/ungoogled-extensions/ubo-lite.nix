{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/ARGaeZLeALIRsuijSwhFBl-Z0ltArvPUOJ-CKdMbUL3RI27qxXQehxFLDTs-E5uh-kq2wKXL36kpjPwSzzPf1A9UBtpDmtC3CWFFVL7CTNsJQj4pTUnzlsthgtG2tNiagPuQAMZSmuXNQ96tXtyqK_JDDWtYTsok8YbagA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1116_1650_0.crx";
    hash = "sha256-CQj0ttGaOPJoG9dG5Fl9eBjwg7s+LjzFU0tAfYlrB/0=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1116.1650";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
