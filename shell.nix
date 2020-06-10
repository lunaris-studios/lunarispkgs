{ nixpkgs ? import ./nix {}, packages ? import ./packages.nix {} }:
nixpkgs.mkShell rec {
  name = "lunaris-pkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    packages.go
    packages.nodejs
    packages.skaffold
  ];
}