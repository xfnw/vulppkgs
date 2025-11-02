{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AfXM71rMcE7E8cQLoNZozMVGtzQ7RlqYFKkW1iWaO8tFJxO39hCwkQEAqMz97_d8oIE2fMgwszzErMGSB0lS-X2Dcj8hQzKxcDPCYBJCGZTiPYkihFVsIGIWvurJTviNehjxAMZSmuW4KHLvFgV6Owhzuk0ADmkMw5xMIw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1028_1744_0.crx";
    hash = "sha256-KfiyMFC7rxFv0sGeHK1d0DIkYk81wToPIWIwsgU3bpw=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1028.1744";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
