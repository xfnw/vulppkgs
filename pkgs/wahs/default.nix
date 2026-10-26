{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage {
  pname = "wahs";
  version = "0-unstable-2026-10-26";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "94a9a82bf9beeddb9c035863100ac8c79c3193b7";
    hash = "sha256-Y/ZNinvYjHsvoEumWKTXCPJMXHf9GczG6WeVAWPI/zI=";
  };

  cargoHash = "sha256-Vzb9xgckZHQdbrQ9A526UDxe8tajMuYIjHXg5XE7lFw=";
}
