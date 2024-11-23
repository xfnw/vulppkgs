{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFv_31Vc2YisToBJYcugR6Itni96T9g3sOeDgtFtdbPb5Ruj57NWyg0GK0kvTNGFYARskBGW-RbgyOGecoNk8M83GHBzLIkORd6w9fEg07X7JhpgLTKCdEgiqq8qA_nDAMZSmuVRMBHZVTNadvUWHfP5DhYxQO9Y2w/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_11_20_858.crx";
    hash = "sha256-QxIaXXHN1ztS4VUWJMB0KD46Vmk0BkidzJLAvpR6CS0=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.11.20.858";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
