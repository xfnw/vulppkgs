{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcPRoeq5N3ngYromr6tkS3LT-fodu-fMYVvI5Q6PG0oRoJLMvaeDdiYd88cvOubxnqAp_T1N5Ag_X4ZEHeVWky51bZAmOsC4yQmUB8h3KmziemJ5kUJdngLAAfiUQIGt3XeSAMZSmuXVf58niOMRGM-4wpJ0osHXU6W_Wg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_628_2035_0.crx";
    hash = "sha256-XeaQuWxtn6WWaQxW/UdKBezB3oyFvt7kFZzECeg8DXQ=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.628.2035";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
