{ nixpkgs ? import ./nix {} }:
with nixpkgs;
rec {
  # go
  go_1_14_2 = callPackage ./src/pkgs/go/versions/v1.14.2.nix {};

  go = go_1_14_2;

  # nodejs
  nodejs_10_19_0 = callPackage ./src/pkgs/nodejs/versions/v10.19.0.nix {};

  nodejs = nodejs_10_19_0;

  # skaffold
  skaffold_1_10_1 = callPackage ./src/pkgs/skaffold/versions/v1.10.1.nix {};
  skaffold_1_10_0 = callPackage ./src/pkgs/skaffold/versions/v1.10.0.nix {};
  
  skaffold = skaffold_1_10_1;
}
