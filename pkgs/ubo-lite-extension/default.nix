{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFvhYflHHWPvBewPmWiJD1YPE_8HB2v0cA48WyJLFNbaa8fM5_ZSaXrLbkl__t9jxyklN-Ye6jX_XffW4dXNoZ2p9Z-fvj66W4_GLN6ebU7fXHnWsT1RKsRtOZ1kqv2rAMZSmuUrzGiXQ-bCtpAdRhUhFQaVJL-3CQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_12_23_23.crx";
    hash = "sha256-y+lOrY7XQUYRppgeESj+o3a3qVc6pL0mgnsiQ3hjmYU=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.12.23.23";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
