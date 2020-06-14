{ nixpkgs ? import ./nix {}, lunarispkgs ? import ./packages.nix {} }:
nixpkgs.mkShell rec {
  name = "lunarispkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    lunarispkgs.bazel
    lunarispkgs.go
    lunarispkgs.google-cloud-sdk
    lunarispkgs.nodejs
    lunarispkgs.openjdk
    lunarispkgs.python
    lunarispkgs.skaffold
  ];
}