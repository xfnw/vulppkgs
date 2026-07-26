{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AUU14H814SXfiSD3fhhDurOxMtlcrlGa9dkVHssIO1N9diVByALOFAUj1eqNrIBApcCyOEGpQS6wnIc8VcBCUyppvhVJmzO3Q43hTbWtDnsNXE8c5kP35tLO2NnjjaKA65eaAMZSmuXq2JRzi19Vz13tGeSawqD26Mpk3w/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_723_1724_0.crx";
    hash = "sha256-ap5qHNULryLU6Ynjw1JcSRvunmDJNvdzHsca3Baokgg=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.723.1724";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
