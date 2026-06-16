{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AcPRoeo-4n_i6ezyJXOmeWbKWvtvt35LQ8TALf4vHA-eQWMWuXoVh0REVWkOZwzux5dt9oIKP4GPAMelJ-2m4LcjPoCqHyN25oYbWNT3MM5Epi_vizZw4czvrUlE_i0sEEDcAMZSmuW8RgTyoW6qEqjJwbNCD2HNyo0OMw/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_614_1502_0.crx";
    hash = "sha256-1I6DgrT0001qcOWvL8Uce1Y+NVKwARFi9T6YtdTZHSM=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.614.1502";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
