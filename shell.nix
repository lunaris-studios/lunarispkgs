{ nixpkgs ? import ./nix {}, lunarispkgs ? import ./packages.nix {} }:
nixpkgs.mkShell rec {
  name = "lunarispkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = with lunarispkgs; [
    bazel
    go
    golangci-lint
    google-cloud-sdk
    helm
    jq
    k9s
    mirror
    nodejs
    openjdk
    python
    skaffold
  ];
}