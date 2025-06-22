{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5iHshcAv76eQ3DS7Q9-_t5UCPBjvG1uK4G6y29zQOoUq5enRVkREA9ViiSrYPDaWbcUDrm8vfNQHWEGzhz35XEClR2F6SKhXSNZyXcuQN3xZ_BFy7rMiJmcQUFVhENyAMZSmuV9NirHA3hzUNCsH5nsLo2HaJtsVw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_619_2143_0.crx";
    hash = "sha256-a84ZsvJYaW49v6LBfyX3ifBgHmu/cnaVTZXpc40fXT0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.619.2143";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
