{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AXJDbcAycbNaXnH8QZNrTUehVyynSUBZfVmQLxANgdV5coiXecMxYuIZsGH8KkIGwSj2qyQFQaxfWxrzVK3NIU8a6TdF6kdQXHZw7x5NkyErWCOC8KAOQPcsxlpjAeug6PxIAMZSmuUa5-MoYmxU2WQd98PkGE_oG8N6Vg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_529_1448_0.crx";
    hash = "sha256-EqMW/QHlECi1aT4AU4Xok0FL+xSZCizxw62CsYmpPvs=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.529.1448";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
