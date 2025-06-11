{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5jxLwvxF_nWvUAYWOQjv1Wnc7WBbbNjFMoJBCGKFtR2cCWiK3igdWh0oLHrCxWil1093uxbBZp7y93HDpEn-x9bDwahow-s11_cLXxYjpVJy9LaOFR2VdPhLnQJwCydAMZSmuXG8NfmKv8cD4ZVzlr6tvA-MxJRPg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_605_2042_0.crx";
    hash = "sha256-v8GByXea04rMBnhn7zlm30ZUDUeHEbjKc/p2aES+TpQ=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.605.2042";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
