{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AfXM71oAdAxF5iRkWIP1N2t2h3twTfUfn5in4iqlOiKikLphqPUvbipw9ZBqUPiugnWcsRdE0X9_qKXD98Cn7Crpg_rA_Ku7xPRVX1kBXZSXwql9b2DJcMI3guy5HbYF1dQGAMZSmuUFMC3yk5hiv2KuypmdxN19ZN_0JQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1116_1841_0.crx";
    hash = "sha256-pQ8NyAzQevyTwQcImqWn+ao7cvBpplIk19AJSeQbY8M=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1116.1841";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
