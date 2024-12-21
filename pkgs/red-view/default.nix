{ stdenvNoCC
, stdenv_32bit
, fetchFromGitHub
, pkgsi686Linux
}:

let
  rebol = stdenvNoCC.mkDerivation rec {
    pname = "rebol";
    version = "278";

    src = fetchTarball {
      url = "https://www.rebol.com/downloads/v${version}/rebol-core-${version}-4-2.tar.gz";
      sha256 = "0jml7ijhb5cg2k0zvbf37gqlf5k9wpr94mkr7pzw8n1q8brvsl1z";
    };

    buildPhase = ''
      patchelf --set-interpreter \
        ${stdenv_32bit.cc.libc}/lib/32/ld-linux.so.2 \
        rebol-core/rebol
    '';

    installPhase = ''
      install -D rebol-core/rebol $out/bin/rebol
    '';
  };
  r2 = "${rebol}/bin/rebol";
in stdenvNoCC.mkDerivation {
  pname = "red-view";
  version = "0.6.5-unstable-2024-12-04";

  src = fetchFromGitHub {
    owner = "red";
    repo = "red";
    rev = "855cad124bf19949105cbea390667af208bbf41b";
    hash = "sha256-1ZZep+NWkyieMvGSaSvE4XQWIW02zXVcs9ZRnK+Arh4=";
  };

  buildPhase = ''
    ${r2} -qws red.r -r environment/console/CLI/console.red
    ${r2} -qws red.r -r environment/console/GUI/gui-console.red
  '';

  installPhase = ''
    install -Dt $out/bin console gui-console
  '';

  preFixup = ''
    patchelf --set-interpreter \
      ${stdenv_32bit.cc.libc}/lib/32/ld-linux.so.2 \
      $out/bin/*
    patchelf --replace-needed libcurl.so.4 \
      ${pkgsi686Linux.curl.out}/lib/libcurl.so.4 \
      $out/bin/*
    patchelf --replace-needed libgdk_pixbuf-2.0.so.0 \
      ${pkgsi686Linux.gdk-pixbuf}/lib/libgdk_pixbuf-2.0.so.0 \
      $out/bin/*
    patchelf --replace-needed libgtk-3.so.0 \
      ${pkgsi686Linux.gtk3.out}/lib/libgtk-3.so.0 \
      $out/bin/*
    patchelf --replace-needed libudev.so.1 \
      ${pkgsi686Linux.udev.out}/lib/libudev.so.1 \
      $out/bin/*
  '';

  meta = {
    mainProgram = "gui-console";
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
