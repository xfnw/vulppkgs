{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-08-13";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "52b77c4d4ffec8fcf5d2fbc5095a7b02a74c6bcf";
    hash = "sha256-tPERLNv8uOQgEJnGkh2rQl4X2m4N2q57WS977EcHYcE=";
  };

  cargoHash = "sha256-0OcpTlDUP3Q3IWEGPoMU8mITstWRUYWHMH6b6FYJwrw=";
})
