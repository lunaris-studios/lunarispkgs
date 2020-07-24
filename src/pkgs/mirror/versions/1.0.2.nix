{ callPackage, stdenv }:

let
  build = callPackage ../default.nix {};
in
  build {
    version = "1.0.2";
    sha256 = "18d4my1025mdgqs91yqi1x8kh67rs3jbzpnglfwc3b0m4gj9ll0a";
    vendorSha256 = "1ackl6j7r06yh2vx5brs68759kh03xx9ndrg5fc942h0p2maznvb";
  }