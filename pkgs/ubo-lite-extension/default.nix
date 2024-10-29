{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AYA8VyynzRKA95WJ-Ao5e3JJBqWjwIqB0IwKWNTaGciz94FA5dsRpb38IkDeWDmmfdSkgAjiHKV1OimHUJm3QusHIYM3-pVJUlrk8I2dgvpZ4RgxCZVmoIBhOqd61M_J_a6oAMZSmuXeXGXKJj4n1xKkDJkf_GAl-tMmVA/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2024_10_28_929.crx";
    hash = "sha256-R4f1NXTZMO25W2szhEy2PpVmPjefK0+RvDTaIQWuccY=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2024.10.28.929";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
