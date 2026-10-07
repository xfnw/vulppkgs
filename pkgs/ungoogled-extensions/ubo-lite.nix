{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcT_rSuwZ5AK00rNcbyYhOeRuCZH5D4vxI10KkGATm2rM5wM-T37Nk6L8RAeBlRr3wlwMUfrz7xDLdRde10UirIZZ-MamIVXbFAs4mQGB6-cwIgtbfO9siLLKARIAYEPAMZSmuXkW76hYOzPeTUiaNJtb3J2It7WFQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1006_1931_0.crx";
    hash = "sha256-bugfnnGh+h0b1v38QfFM+nOb22jm7hN79SmQeq/dcwg=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1006.1931";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
