{ nixpkgs ? import ./nix {}
, toyboxpkgs ? import ./packages.nix {} }:

nixpkgs.mkShell rec {
  name = "ci.toyboxpkgs";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # Make sure to remove packages after you're done testing 
    # to keep things organized.
    toyboxpkgs.consul
    toyboxpkgs.nomad
    toyboxpkgs.waypoint
  ];
}