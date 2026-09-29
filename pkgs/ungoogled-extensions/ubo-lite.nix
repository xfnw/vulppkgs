{ writeTextFile
, fetchurl
}:

let
  extid = "ddkjiahejlhfcafbddmgiahcphecmpfh";
  crx = fetchurl {
    # returned from:
    # https://clients2.google.com/service/update2/crx?acceptformat=crx2,crx3&prodversion=${chromiumMajorVersion}.0&x=id%3Dddkjiahejlhfcafbddmgiahcphecmpfh%26installsource%3Dondemand%26uc
    url = "https://clients2.googleusercontent.com/crx/blobs/AZPVhcQhJxDc1fMtbcv8yy3kPRzuYQh7tkIQqfh1ClyHMHq0sVD4V-V7NRykHFfDnh-5bVycL8ZDIIN9WBjcRWWXsmtvRF2VSXRYdYlhIubF9SQvmyNEBfXhQ_8xe6NMNFxVAMZSmuUjmbYdbDZtEwk6s-4e6T_cDo4VAQ/DDKJIAHEJLHFCAFBDDMGIAHCPHECMPFH_2026_926_2202_0.crx";
    hash = "sha256-4nreDuH5A7xxCU8DdJM3ix1CoKNM/lFuaT6ha2lBoeY=";
  };
in
writeTextFile {
  name = "ubo-lite";
  text = builtins.toJSON {
    external_crx = crx;
    external_version = "2026.926.2202";
  };
  destination = "/share/chromium/extensions/${extid}.json";
}
