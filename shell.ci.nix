{ nixpkgs ? import ./nix {}
, toyboxpkgs ? import ./packages.nix {} }:

nixpkgs.mkShell rec {
  name = "ci.toyboxpkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # <toyboxpkgs>
    toyboxpkgs.jq_1_6
    toyboxpkgs.nodejs_12_18_3
    toyboxpkgs.python_3_7_7
  ];
}