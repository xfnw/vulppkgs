{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcpJF5hzp3RBTiwJ_duQfRyy1ZnJkn6t59lVQBGyX-xOjNKuBSkqt9JOev86zBa8XcDHvd_LJV3lY3GK76AS4sFR5Ph1q1_sPdYmVwpTCHh-37V5FaJdBGJtTTpAkk7uekeeAMZSmuUYtwwfki8GpPqm4SyUj2fKDC28RQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_831_1814_0.crx";
    hash = "sha256-zpNX7k89rGsXa402A+QLM3L0jfGTZdiMgJ2FcgGlhd4=";
  };
in
writeTextFile {
  name = "ubo-lite-extension";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.831.1814";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
