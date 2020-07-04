{ callPackage
, lib
, darwin
, gcc8Stdenv }:

let
  build = callPackage ../go.nix {
    inherit (darwin.apple_sdk.frameworks) Security Foundation;
  };
in
  build {
    version = "1.14.4";
    sha256 = "1105qk2l4kfy1ki9n9gh8j4gfqrfgfwapa1fp38hih9aphxsy4bh";
  }
