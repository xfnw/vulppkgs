{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AUU14H94yEn4py8PyVdW9IpQeR1bMGdgmIgt-2TXbiJ1tC6BMKBnbkw1_QmxcVEZWrWlQugTgc2ctI0xC8lw4FEW63NJ2EOZyXFH2QjK2FfV9Ka2empgorRy0_FCxFN6tEIVAMZSmuUmFyisERFeB7_WfdVeHZudsG6bSw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_714_1952_0.crx";
    hash = "sha256-aHI99ZNBOa773y3sO3ULfiaDsu+hrdoKrymy25KtfxU=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.714.1952";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
