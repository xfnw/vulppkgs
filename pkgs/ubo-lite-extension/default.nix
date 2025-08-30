{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5gz3hw5m59GY4Yc-U5B8ACPGyk8MFb35QbuXqzFt3FFyWglKsL_tgIkCt75pSbPkBS8aUU_xAEdTMn9tZ_RfcXgZFqOpkevWuXqmEVNnP-Wwx35rbQVDFxa_m6kasebAMZSmuVI2WMCjdSacAmJr9sFg1jVllBsNQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_825_1605_0.crx";
    hash = "sha256-b1tas+Lb43kR49KPAEckPioRkm/ZEhwALt+8mCWGAng=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.825.1605";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
