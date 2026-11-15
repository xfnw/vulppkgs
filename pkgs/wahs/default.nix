{ fetchFromGitHub
, rustPlatform
, pkgconf
, zstd
}:

rustPlatform.buildRustPackage {
  pname = "wahs";
  version = "0-unstable-2026-11-15";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "2809d33c22925a3ae9be768d1008767b546d6142";
    hash = "sha256-yVAVR3aUichMCVWZRGJngqImuo90l6stW7qYTRnlXM8=";
  };

  cargoHash = "sha256-PU8pdM4+lNsL0xp/t//3ywnlwa481Ohfp9xaRUqnU3c=";

  nativeBuildInputs = [ pkgconf ];
  buildInputs = [ zstd ];
}
