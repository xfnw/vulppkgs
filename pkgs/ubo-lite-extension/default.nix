{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AYA8VyyOIBwcriEI6FoBbc2YuBC8f-fNhrgmgI0TAAidHteFaojy8KE3dUE7Z8nAMQnLnbXtLW0GegpuSYcag3bU4cnquhq5oA2NWppcdHO4orS2R0YzM60jhBwfJvdWPvcfAMZSmuXJu9eJvSPGFfIZyRyA3o_OZ6tA_g/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_11_3_1351.crx";
    hash = "sha256-/JaOBmS6vb+j4iErSSwyU9rd3pmovmtWzjA0C/Mhpsk=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.11.3.1351";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
