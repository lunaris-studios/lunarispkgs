{ callPackage
, withGce ? false }:

let
  build = callPackage ../google-cloud-sdk.nix {
    inherit withGce;
  };
in
  build {
    version = "286.0.0";
  }