{ nixpkgs ? import ./nix {}, lunarispkgs ? import ./packages.nix {} }:
nixpkgs.mkShell rec {
  name = "lunarispkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    lunarispkgs.go
    lunarispkgs.nodejs
    lunarispkgs.skaffold
  ];
}