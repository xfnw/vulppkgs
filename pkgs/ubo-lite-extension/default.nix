{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5ixQXfEKiuLsufKe_47guiFydxZFJgJG7tnasmqXwn0P9fHsfh8S49EKmNIPK32ME6y1tpSG3tpERRejybDyOJQNvbU1WY_N2sRwf2w-CRdncZKJmxR4F615awnIG4MAMZSmuX_JQj_bUovvBaexPvhC1RAB5YJyw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_711_1256_0.crx";
    hash = "sha256-4pZSTfLVUSP7TnBBeUgNxp67diTNA4NOgiOqn+tfgpk=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.711.1256";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
