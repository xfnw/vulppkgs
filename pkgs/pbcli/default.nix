{ fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "pbcli";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "Mydayyy";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-Y6R6Z2EBxnzhPs/belXH8t39tqwXE/brl3gMUItWjfQ=";
  };

  cargoHash = "sha256-F0TNm4SsW8bb1A5nySXUbn7/RGyBE6PBMCekBq/Ubg8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i '/^openssl =.*vendored/d' Cargo.toml
  '';
}
