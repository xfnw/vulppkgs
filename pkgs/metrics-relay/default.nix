{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage {
  pname = "metrics-relay";
  version = "0-unstable-2026-10-15";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "workspace";
    rev = "542f2bbbe80a21104d81cb55c83883189e9e0b96";
    hash = "sha256-UuFCXa/ZT2kOHohD5hXFqgPegh2cKK4jjzdT11nxwt4=";
  };

  cargoHash = "sha256-MK3l+xCQEn3surt1N6qXcoL2qdYKD+OfCmLVTfrBF1s=";

  buildAndTestSubdir = "crates/metrics-relay";
}
