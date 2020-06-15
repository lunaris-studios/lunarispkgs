{ callPackage }:
let
  buildHelm = callPackage ../helm.nix {};
in
  buildHelm {
    version = "3.2.1";
    sha256 = "1453qkd9s4z4r0xzmv8ym7qfg33szf6gizfkb5zxj590fcbsgnd7";
  }