{ nixpkgs ? import ./nix {}, lunarispkgs ? import ./packages.nix {} }:
nixpkgs.mkShell rec {
  name = "lunarispkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    lunarispkgs.bazel
    lunarispkgs.go
    lunarispkgs.golangci-lint
    lunarispkgs.google-cloud-sdk
    lunarispkgs.helm
    lunarispkgs.jq
    lunarispkgs.k9s
    lunarispkgs.nodejs
    lunarispkgs.openjdk
    lunarispkgs.python
    lunarispkgs.skaffold
  ];
}