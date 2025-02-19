{ fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "pbcli";
  version = "2.8.0";

  src = fetchFromGitHub {
    owner = "Mydayyy";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-JusJ1ovhETW5caTW2suNvKpw5Rl+CeecmCPCFRIi7N0=";
  };

  cargoHash = "sha256-Q0yTOGs80du8ymylp6A5zkH47+PvZq+v1Ufr9iQu1P8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i '/^openssl =.*vendored/d' Cargo.toml
  '';
}
