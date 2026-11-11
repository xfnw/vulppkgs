{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/ARGaeZK1zEchf7mNslVwmgsMkLvWz57QtZ-hIf9KmrdEuPJzarqJg5KI6TzQ5fs5Yq9aLKo61R6_XKBQ2538VdnMQWqSv5wner4CpCD_8gU8DxY9pQQ2wTtr9tjI1pAkrCVWAMZSmuXdZhuwHc0UmR8nl2b6kGKyttZeIg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_1110_1816_0.crx";
    hash = "sha256-+DD5sqxsQNzn8ZNxf9KGpMlm6JmQGNWj51mY2BdRu4o=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.1110.1816";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
