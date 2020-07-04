{ callPackage
, buildPackages
, stdenv
, darwin
, gcc8Stdenv }:

let
  build = callPackage ../go.nix ({
    inherit (darwin.apple_sdk.frameworks) Security Foundation;
  } // stdenv.lib.optionalAttrs stdenv.isAarch64 {
    stdenv = gcc8Stdenv;
    buildPackages = buildPackages // { stdenv = gcc8Stdenv; };
  });
in
  build {
    version = "1.14.2";
    sha256 = "0z3zxsnhmsxplnwfw1l9gr6jgglwp50sr3p5njknv9i6jzk89plq";
  }
