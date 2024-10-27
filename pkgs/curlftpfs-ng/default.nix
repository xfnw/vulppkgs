{ stdenv
, fetchFromGitHub
, autoreconfHook
, pkg-config
, curl
, fuse
, glib
}:

stdenv.mkDerivation rec {
  pname = "curlftpfs-ng";
  version = "0.9.3-unstable-2020-09-05";

  src = fetchFromGitHub {
    owner = "ikn";
    repo = pname;
    rev = "12c72da670e08362dab6ea3625c2b08e52550b1b";
    hash = "sha256-M48ovjWqmwVKwcudTSECWZPLIg6yj4ZuNDKcrtkSjtM=";
  };

  patches = [ ./conditional-interface.patch ];

  nativeBuildInputs = [ autoreconfHook pkg-config ];
  buildInputs = [ curl fuse glib ];

  meta.mainProgram = "curlftpfs";
}
