{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcmIXbo7RjUmSXezWWukSxhtfIb5TFP8P_8kwQbHizpKo-JD4Zod5JL8EvF6CjRYIVM82VKaBqs63XQ-nI0xRRo82SDuKB6sND5JW-u3sRYf-KB2eHTgFkpMxMQN1OJh1i7EAMZSmuUsID8OI7DB5KKXKXRxawqg32-1FQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1_14_952.crx";
    hash = "sha256-83n+pb09IdxVBmR02f53uhbsTiavVdYXSaXZvRTeToM=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1.14.952";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
