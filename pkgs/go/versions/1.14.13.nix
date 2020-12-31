{ callPackage
, buildPackages
, stdenv
, darwin
, gcc8Stdenv }:

let
  build = callPackage ../default.nix ({
    inherit (darwin.apple_sdk.frameworks) Security Foundation;
  } // stdenv.lib.optionalAttrs stdenv.isAarch64 {
    stdenv = gcc8Stdenv;
    buildPackages = buildPackages // { stdenv = gcc8Stdenv; };
  });
in
  build {
    version = "1.14.13";
    sha256 = "0xxins5crcgghgvnzplmp0qyv2gbmh36v1fpl15d03jwdd6287ds";
  }
