{ callPackage, lib, darwin, gcc8Stdenv }:

let
  buildGo = callPackage ../go.nix {
    inherit (darwin.apple_sdk.frameworks) Security Foundation;
  };
in
  buildGo {
    version = "1.14.2";
    sha256 = "0z3zxsnhmsxplnwfw1l9gr6jgglwp50sr3p5njknv9i6jzk89plq";
  }
