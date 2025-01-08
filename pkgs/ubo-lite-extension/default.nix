{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AW50ZFsM4JC2O15qBo9HgX-AjJ1svdLqPJbEbxKrM9BLaividNt2Rz6TNOp79-p0aRy69byv9_gb1VvUeTGM4mCrwF90yrb1W-WFEjIPjGFnj7Z8BYQ0pUYU8Ie1mEbbP20_AMZSmuVr--Hoa7t5Tg0Jr4x8KcPdvjFRTg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1_7_268.crx";
    hash = "sha256-onzjK5vSpsPnt6HxFm9fplVcyQKhEMXrW466agN268I=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1.7.268";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
