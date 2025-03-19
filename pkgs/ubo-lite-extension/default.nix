{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx3LWVgEKZqVSSZM9tf9JxVQUbexvnaiJK0aCg-OTn7SIT6dtz05tBOQmbOrd3JWOL0iPiWi2GOceKGDSBGWKlH5lgbjixiBPQIIKExmkFeqHkvJVyWtGtJZc-3s36FVAMZSmuU80YOHY7upDL_u8c99csau3vhkoA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_3_16_1281.crx";
    hash = "sha256-Ml1pMTDtaypOgsUd+6M2MWe4NXUYk5jRqdMA02y2VVU=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.3.16.1281";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
