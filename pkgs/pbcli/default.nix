{ fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "pbcli";
  version = "2.9.0";

  src = fetchFromGitHub {
    owner = "Mydayyy";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-zGkOX+AL9VI1zBAnb0ihKNw2no6ajqzVFk1/Bi4u/jI=";
  };

  cargoHash = "sha256-prG9zDK2g4weMkNi+WDKPoDxlz7luK9xZDuWl4ByvlM=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };
})
