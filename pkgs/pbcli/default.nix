{ fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "pbcli";
  version = "2.8.0";

  src = fetchFromGitHub {
    owner = "Mydayyy";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-JusJ1ovhETW5caTW2suNvKpw5Rl+CeecmCPCFRIi7N0=";
  };

  cargoHash = "sha256-MYPDKpExCRI+wJnaGP/rUmIEF1Q4dxxcHtiPZ8syXdc=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };
})
