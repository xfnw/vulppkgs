{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Ad_brx0-Y7jrnP2hrMKf18CuMnbg252WjM4VgVTMDeeYPsKtw0duJbRGdARR396g9fU8mvomtM2_Veg9P0BOG70mMrXB61fbnQJL9dZ35l6XV4p_5szrI4mIxZGQkWvcPhdCAMZSmuX9z92M94UJwFzcDoXvOWqPWB4c5g/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_3_8_1350.crx";
    hash = "sha256-zMbJpca1JCrTKW1F16mYDlCRDKertyXoWKwqelpETcs=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.3.8.1350";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
