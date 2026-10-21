{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcQcOwuqA1tF-hrKU1DhlpuJl0y3IzyP0OGgqf7AIQz-HLJKzyqSxZZL0meFhNE7DfBRGnn4eKJiaZ1lCgMDeI5xPn-wP39WpR4TJeMqYcmVvl_m05mdLry385oFMgoiAMZSmuWIGDIO0S3S583SKbmRw7fdDFEvDA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1021_1354_0.crx";
    hash = "sha256-CIdVnrnmhk6RtS5KDGYJla3kfAhNzHFQ7ZrnQ8lHWnY=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1021.1354";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
