{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AR5vvTp9424onrfnUtprYRBO7jIsN3eXIpqcj4_LPGgoJkqd3q55Q1sEhLCfC4li1uL-z3isLltoe-KJCLL1ZxT2AXhN-8zVk5Oz_hOUm_mhboluzkN7BIvjymdzn7fJ6jJ3AMZSmuUlbLLZFvK5reHCq9doP_s5dK4_HQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_5_4_1310.crx";
    hash = "sha256-n8dglpYweQ9ttsYWcE08TIrtmrCy2VRh1ja6YR/dUQY=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.5.4.1310";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
