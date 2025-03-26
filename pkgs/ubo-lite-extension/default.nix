{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx0nK6LNwzsx_Lx5iDiDeSPgSlukS2tUfLO-HXGEdDumtOzbPCpFexxhKJvz9gSsTxvFBbH8hvEItMB_oQ_Wj6iKT7Bepxx0zvHPjMdI8iY3BdHZdplQruDqu1DxhTfnAMZSmuWQxZ86OvCKQBWbwTGW3elydiFFxg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_3_23_1241.crx";
    hash = "sha256-0dkEUStcDgVfLhW8bzjqxEyv2Ks4E8j+og6Pyrr5UGY=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.3.23.1241";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
