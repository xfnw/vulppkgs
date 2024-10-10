{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AYA8VyxN0Ooo83z2BMdxKlExKLdFMOoleSf71Q43L_FU5xpVWxVJlrGTN3vQ5-3PP1CxDOBBlZvCPTdRSKVI0WK9kddH2Xp9E36H0aC0fQDzlqTMU0vmRPswo5D6j5IGXdVVAMZSmuVLTpv_wFxN87qdpE2400aIzie1KA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_10_6_1334.crx";
    hash = "sha256-OeLTkNjTuIFW+nCvWVS+8ZahMnF9w1KGUvySFi4boVc=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.10.6.1334";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
