{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-03-13";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "706522b00ff41b9d29518d736467a3d85298bbce";
    hash = "sha256-Ui0WeCSA/o6AROk0R7EYRHVNA5Au2kiWQKCQtWTnAtQ=";
  };

  cargoHash = "sha256-MGZOfSAclqSF5NLDqZgBNH3xyUR0r32yPY1Q9WcKI8g=";
})
