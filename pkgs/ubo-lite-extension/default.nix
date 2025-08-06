{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5gMIFuAaHn0FFp68CrZ93QxQZy-ZdHByJ9dgOlV4DyJDFkuh2xVu9p7M-jlwNtdc3mMNG2R1ekBnzT0_2bVbrn-XUVjqJat2r7m__oOOmPguSPIadZ8_f8j9gZtRyCSAMZSmuVAWsylzY4_jKXyX-xs-W2acG67JA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_804_1547_0.crx";
    hash = "sha256-A/m5U6Awp72S522npS9AsVP0Bdv9umS3ERC5j9+KnJM=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.804.1547";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
