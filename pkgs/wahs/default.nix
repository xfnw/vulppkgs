{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-07-02";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "950950443b70a2244cc0f02bed1928a81cbafde0";
    hash = "sha256-f7itWlWelrhuEwUkJSdoBWEM0gj9CWTdzrQpxRI4jDU=";
  };

  cargoHash = "sha256-K0mjtXKnoXpkkRVp/vvKt67wwKi8ZQBvrGnESKifetM=";
})
