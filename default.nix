{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  self = in self
in rec {
    nodejs_10_19_0 = pkgs.callPackage ./pkgs/nodejs/nodejs-10.nix {
      inherit pkgs;
    };
  }
  