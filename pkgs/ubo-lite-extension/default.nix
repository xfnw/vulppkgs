{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5gb1aS4Yl6yTjTHH5QmZhIXXkR245HKfgO-nwt4HMAhsCM7cgdxvsclixHu7Dq-LlH4tV9UPOamDcl094Aojrr8LC0jeDamusDOM9ghsh1bGaTSJ2b5LwZPg8356fmHAMZSmuVLrJKJtbdhM4XmoAVrEcnHEezupA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_601_2131_0.crx";
    hash = "sha256-P+8px5I00vyu+0+2ATONMW2OjqXKol946yWnT5EZXVM=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.601.2131";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
