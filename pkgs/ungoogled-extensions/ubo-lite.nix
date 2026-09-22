{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL6exB5A9C6zXrU6Xb8k8iIoidE2hkg07Ut_jSkCvgcPKYZ-hlE_E6vZbv-O3y3C1t8CYQMprVxPeTa61ammiwSkwVNrvfw8behw-P8dqmrlduU8meXWTQ3dQVJ2EOUxAMZSmuXMH_77HQ-ZNHSVy6ctvKbSiQfJeA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_920_1710_0.crx";
    hash = "sha256-8I+FQ79dby6znBSfA7cRlNhYCTVOkLsIdhHNerGhhGo=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.920.1710";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
