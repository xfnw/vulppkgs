{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcPRoer85OfGY5lkeXtLNQXWP21yOKl4I4W8ceN0z_yReSo07QCJ43cLsl6q7UMLZ7TPE9Jg72e7fgpWjUBObP2jpMJWk6RUFxMr4l9CvEM0dX7lwo9POllp1mRuIRVWTZ5WAMZSmuWBYbDfbhGWPl105WmUMd1TUcGpSg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_607_1724_0.crx";
    hash = "sha256-Q4eVNRH7uBLAvAu/wCVHn2dH0kLg27mrBuUs2Kh8T+s=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.607.1724";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
