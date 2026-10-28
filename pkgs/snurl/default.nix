{ stdenv
, fetchFromCodeberg
, zig
, pkg-config
, openssl
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "snurl";
  version = "0-unstable-2026-10-15";

  src = fetchFromCodeberg {
    owner = "liberty";
    repo = "snurl";
    rev = "660ccf714ac4f29f4cf4d1f5a9adbb8f4f5a4b3e";
    hash = "sha256-gwZGIkEJv3VjiA0EXOMg5ASp/iuJ9S9ahdy6jUbedCs=";
  };

  nativeBuildInputs = [ zig pkg-config ];
  buildInputs = [ openssl ];
  strictDeps = true;

  zigDeps = zig.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-DrXQnKH+HVq/+H3sD6srQu3lBkSz5k3AoiFInIxUNw4=";
  };

  postConfigure = ''
    ln -s ${finalAttrs.zigDeps} "$ZIG_GLOBAL_CACHE_DIR/p"
  '';
})
