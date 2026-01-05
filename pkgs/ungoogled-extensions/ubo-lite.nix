{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AdNiCiXwxXQdAU3BPVykzEShPFRTK8HB1omlDtT4YUifmHxs5lpRAaNYHzmuFDdTXVVxZvf1VMMmiFfs6VO_rfRFR8UDDqvzslQMpS87sPRPZvhrPaDT4Ag5FjZ_Y9b9h5qRAMZSmuW9htQ3lwTBChnX4jEYRKvP4FfPxQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2025_1230_2048_0.crx";
    hash = "sha256-nAA6LFOUMFNrc7jgkN2afNwQM8vOUpUmZ71W9yQphl4=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2025.1230.2048";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
