{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AXJDbcAiqwgFYx43gsHwzLCSOy1S19PR40B-A3VvRysxamLcnXKhyjkfIf0MkUoSBMThA6vH8VuKS_FuHrhanjE4hxGU3hJDOHVF7btq_xnWX8NriybOvsclHsKJ1Ia_jxgZAMZSmuV28_8Lv59kGbXRzsFgSnQQvxU07Q/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_422_1301_0.crx";
    hash = "sha256-T+6R0cPsi9hIHdngZO7qQk9XNmQEYloYCfvW1llWLek=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.422.1301";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
