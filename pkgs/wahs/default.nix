{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-04-20";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "4d9bc08488fdc29e33b0f9c19e51dd5a6b77149f";
    hash = "sha256-d36oS57uG5hNlmw0JkfhThaaXn0h4NOMiZg5vIqW07o=";
  };

  cargoHash = "sha256-7Aj+5Vnlitcn33Y7iuwrUBKxIXQydYlVWb4edgoc1go=";
})
