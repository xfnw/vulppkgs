{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-04-20-1";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "b853990b436428e007ba4cda7b20261194b35831";
    hash = "sha256-mgr8ia0MJr4OtRzTqNYTqvlUeRriUMV3InK0P9wpSQg=";
  };

  cargoHash = "sha256-7Aj+5Vnlitcn33Y7iuwrUBKxIXQydYlVWb4edgoc1go=";
})
