{ callPackage
, buildHashiCorpPackage }:

let
  build = callPackage ../default.nix {
    inherit buildHashiCorpPackage;
  };
in
  build {
    version = "1.9.0";
    sha256 = "1kj7s8lvm26ijwv3rdpsdzc60hg1awxgwrzpld5bm4zcki7rd6s0";
  }