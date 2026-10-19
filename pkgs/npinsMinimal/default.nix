{ rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "npins-minimal";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "andir";
    repo = "npins";
    tag = finalAttrs.version;
    hash = "sha256-PRdGQlxpv8qXdQ6KwlP2Ky2HBHDY83lGTSiD6yljUxE=";
  };

  cargoHash = "sha256-N0Hurb/cmXCDS7EZlYCct9WPbUMXvU+0TK1cBY6+mYc=";

  cargoBuildFlags = [ "-p" "npins" ];

  meta.mainProgram = "npins";
})
