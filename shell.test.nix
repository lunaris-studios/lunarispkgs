{ nixpkgs ? import ./nix {}
, toyboxpkgs ? import ./packages.nix {} }:

nixpkgs.mkShell rec {
  name = "ci.toyboxpkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    toyboxpkgs.consul_1_9_0
  ];
}