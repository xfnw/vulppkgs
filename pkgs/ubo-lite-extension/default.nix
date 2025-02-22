{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/ASuc5oiO5WOvTNjgZXdxSMj5aoXV9Mq6vpbZXCiHFa9n3zQIyZXrADGjrwcfeWUvM3X04t5MpmIyxdjpQjTlvcLOkf5hYWvPs4f6dMHQ-g2wbJeFswp5u3wIHgl28erenY0KAMZSmuWLydNRPS-Mf6dNlskjRQht7ft2uQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_2_19_775.crx";
    hash = "sha256-1PFVLmBsEFwnnAYfG7RX5PQuFqlDR3zjNvCNsIaU204=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.2.19.775";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
