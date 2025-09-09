{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5izedtzKsgmbZdI4hQLGZAOBwI-D8U3uB0UAxqwaFrO6ZrPiOJhy3sDtvRglWJulDebbujLfLAK-G2XXl97KJGyXDmsw__WPvtXFqN39G2admAGugpW9VDT7ByXjvJnAMZSmuXVbGmz1Pc2SX_rnRHA1HUiPgTErw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_906_1308_0.crx";
    hash = "sha256-ORIkDJ8yMjUP+FLPfq+6k0wpZqVhL1hkdu1YBDTtiN8=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.906.1308";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
