{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcRYe4sOX4czxaaPxT3nVyfO8lRbp_p9e6Y4yNYVdUcK-wxqKE0sQaqlVLIxO-KTgEOdZK5Ktmf1qE00-EJKrCrTdK6bkMRrSn5_Znc34sd_N7JYlX6_7xlhYWKVHZUGAMZSmuUG6Xe5Tcl2Jcrk-dGTNkrFF2fBRg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1018_2229_0.crx";
    hash = "sha256-VZ0Q733LlrxOgS3ms/8MLmx6vKV4Mk2Nev19jPeKbdc=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1018.2229";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
