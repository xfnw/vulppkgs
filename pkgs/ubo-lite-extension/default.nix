{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcLY-yTwGVsujPgeyaunSeAvdClIxMVRVx02e2MoF2O4ilPjLPJh1fv59Iz_8b0RSn0xY64R5swJVM3eYSWuV38pVy4d1sVAOHNc7hPbphjhEV-GQ8CI30vlyU93h7-yiiaGAMZSmuXJ8MiIWRYgzDrCdWjAYSuyGQHc1Q/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_921_2008_0.crx";
    hash = "sha256-iPYG7lApKqPi6GTJ/U64fC4a5ranvDVn6nMu7LOw3K8=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.921.2008";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
