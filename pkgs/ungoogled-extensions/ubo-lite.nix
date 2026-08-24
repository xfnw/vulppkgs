{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/Abe5cL6jgS7UbQLqrOGJVZfqnpyWC5zn5nRV8xCUDS7yyvZrP9tuSCLz7BA-Drzn0iJ8GA_MvO4e0CJ-Rhd9rD6_5I03LdpaB7C-Y1HDKaNcvq9598BEIfoE4nFT68I1_nm5AMZSmuVfu8goBvj3Em6oiQCK-5QL1fHNTg/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_820_1159_0.crx";
    hash = "sha256-fBzFyuzCdxv3NW0RJTIu/1wxNSFFr/pCVtfdZnWZTAs=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.820.1159";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
