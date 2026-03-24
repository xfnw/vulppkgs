{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AQx-wa5PSHJWLTkFYRWtd9NCTliU3hVo57ZL1t4s8NFxEI9WSKglfYQDkPiTR2tl-ZTFI_mj6YcXyxTqzy82O2qHDiOcoknt9RTT196pu9tUc4g7ymRpWMDaP7KmQCrHeE46AMZSmuU9YAsaJgIFtBsLFVo1EybNji8NXg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_323_2044_0.crx";
    hash = "sha256-GjaAL14UhUQ/L5lSdWTAM2NxruKCfJnysGxc9hQ+fPI=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.323.2044";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
