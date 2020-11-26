{ nixpkgs ? import ./nix {}
, toyboxpkgs ? import ./packages.nix {} }:

nixpkgs.mkShell rec {
  name = "toyboxpkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # <toyboxpkgs>
    toyboxpkgs.bazel
    toyboxpkgs.cargo
    toyboxpkgs.clippy
    toyboxpkgs.go
    toyboxpkgs.golangci-lint
    toyboxpkgs.google-cloud-sdk
    toyboxpkgs.helm
    toyboxpkgs.jq
    toyboxpkgs.k9s
    toyboxpkgs.mirror
    toyboxpkgs.nodejs
    toyboxpkgs.openjdk
    toyboxpkgs.python
    toyboxpkgs.rustc
    toyboxpkgs.skaffold
    toyboxpkgs.waypoint
  ];
}
