{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AfXM71pq5gukRWrcBWi7L1fVpCZOhAp9bLgMbjwt3Pxt53Z9qygk3wpRsr971MUqlUU5LAmcaERke5Q9uMYcFAYwpfYREL3ISimrpMlKEfrPSVaKvcqjOxssYkilnBv7RLlsAMZSmuVnBQnT4LzDUC6cPf3xK0DebFgkaQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1123_1640_0.crx";
    hash = "sha256-qB6gton58QTkhXuGBOPAq4PNOm58Knt6ERaXzarwTCM=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1123.1640";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
