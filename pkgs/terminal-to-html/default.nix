{ buildGoModule
, fetchFromGitHub
}:

buildGoModule (finalAttrs: {
  pname = "terminal-to-html";
  version = "3.17.1";

  src = fetchFromGitHub {
    owner = "buildkite";
    repo = "terminal-to-html";
    tag = "v${finalAttrs.version}";
    hash = "sha256-KRR+rrEUrYYZKgn3RHm/bvvL+GncxIa9mcdfqW07r3k=";
  };

  vendorHash = "sha256-OyYdz012tGnSFzSMtPxgWaaaUXHer5r3URIhipIZtzo=";
})
