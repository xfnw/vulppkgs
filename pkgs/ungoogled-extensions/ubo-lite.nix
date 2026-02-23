{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Aa54OTC_Z65k43Frjm8X4e3Kk4vxoagEMjtZsMzPgC4LoD37cw0ZA0SxZnxtkVVh2NZ2jdPbt4hRqBIbRiY5T4ItbVWaM_cSoXxytjYiuXPVR17nqW0nwvrHqRf4n9maB2NOAMZSmuV5p2_Iostu53MXWMlNNTvzFXThLA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_222_1657_0.crx";
    hash = "sha256-GMKwpw/bLFLjufv0g5E1h0Sjcu/rmXTj4KgOCpGRhdg=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.222.1657";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
