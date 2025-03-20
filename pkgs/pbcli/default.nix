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

  useFetchCargoVendor = true;
  cargoHash = "sha256-MYPDKpExCRI+wJnaGP/rUmIEF1Q4dxxcHtiPZ8syXdc=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i '/^openssl =.*vendored/d' Cargo.toml
  '';
}
