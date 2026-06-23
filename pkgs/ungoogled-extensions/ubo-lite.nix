{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcPRoephyu7zjwHu1qlyUxNf2f20fPSmtlQOSZ06QfrIuEPAoH1VaWedcCnRdCaPPDSagWIbRAimtTl5ZR-m4PYLVa0ilqERB_6H8MsgLaoGLHHmSJ2BsbLHV06zkC5C3gwtAMZSmuUFh8X3eP8xsWLRkLjFP-GoSYyKPg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_622_2316_0.crx";
    hash = "sha256-Q3hWb/O8+1xxuR6d+9v7kYtPIaenwKr/kbF75GeWnuY=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.622.2316";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
