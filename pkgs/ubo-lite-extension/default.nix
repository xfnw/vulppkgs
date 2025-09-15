{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcLY-yQNjVpIXd5prwgopA2ACSw9Op1caPLYg2ptanJdL2Xye-CRhWZf7HfMOb7VKXPGM7F-aL5zyeIBO1cNOS7prV29uFxhlW4pGjKZ3_0MMz2bHveujdiTz76PO6R9xYZeAMZSmuU-ik8lGOkqGv9CEgnQ60Dno6b-NQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_911_1335_0.crx";
    hash = "sha256-KY+8+fbUkR+B89L86uelYb7kfuIjnfY/lHtASZvW8jI=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.911.1335";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
