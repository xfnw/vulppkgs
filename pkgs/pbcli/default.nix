{ fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "pbcli";
  version = "2.5.1";

  src = fetchFromGitHub {
    owner = "Mydayyy";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-41Sgey8xDyZk23WG+Yj+uvI5qVCvY/SbbyBTJGYdmaA=";
  };

  cargoHash = "sha256-5URF33zY84d8FautDosKzg3BdoMbWqEGIHNgy1ZQ/y0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i '/^openssl =.*vendored/d' Cargo.toml
  '';
}
