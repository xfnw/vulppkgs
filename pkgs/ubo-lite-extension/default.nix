{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AYA8Vyx8uGC1capo5M9iEtbGYLBAroyG6E0lM37Br_-0R-wMv8_fDZptSyPMHUM7JdZavJ9OjiNYenFjRkXa-yD11hcP4lTiAHL4VoDoH0N0_0cMKb_WfXJUKEznxPJwrVP7AMZSmuXetjKQaVXJlIezCEQf8d8vDotZSw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_10_20_869.crx";
    hash = "sha256-33drb8XFVvGlq1Bgfrl3Xy19VnP1DZbzLS35B58sfLk=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.10.20.869";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
