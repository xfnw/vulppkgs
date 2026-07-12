{ fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "pbcli";
  version = "2.10.0";

  src = fetchFromGitHub {
    owner = "Mydayyy";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-Hs12wkToGXbX9CIq+xV2b1HvTfFbUKROwvd5Un0G+SA=";
  };

  cargoHash = "sha256-stNRcS5N4QmoYPAgCyOzdbHKeqewGxIzeDIrH8ovZq0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };
})
