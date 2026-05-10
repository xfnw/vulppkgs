{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AXJDbcCqFvSlSRqpiJ2sNPagzmQEGUJte4sSIaJLcGnICZd4Gbgmx5TlrJ_EzC0ob-pORDci6NlJHZv2yivTk_X6irjg0tj-C1667yPkFlqufYbLLf2D_SVpUhiKu7NO63ebAMZSmuVY62uR8J-fKLw_YKqGWqgVf86dkA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_507_2008_0.crx";
    hash = "sha256-cF0n5HY8bmFfVEFPyAmFn+2IG1a3KBAfgIIPxzd813Y=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.507.2008";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
