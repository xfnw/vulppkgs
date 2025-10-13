{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcLY-yRnWCLoPokR_SX_m0syubl1EWOP2scYc9_cr0vasGnsIVD2j58b04H-abA3ttsE_uzN-g1pqVxTcjdYQPnaeRgA8RFf_Lf-bhZ1iYzQh0AbxpNqI89q3C5VpsXLxicNAMZSmuXZduyX2taeJq5iDM0-yy_rNgg_6A/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1012_1712_0.crx";
    hash = "sha256-w/GgYzZQ5u2XXMgxJaoDTAErysl2HOoXeE4BjZbN96o=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1012.1712";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
