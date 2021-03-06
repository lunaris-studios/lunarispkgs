{ bazelSelf
, buildJdk
, buildJdkName
, callPackage
, darwin 
, runJdk
, stdenv }:

let
  build = callPackage ../default.nix {
    inherit (darwin) cctools;
    inherit (darwin.apple_sdk.frameworks) CoreFoundation CoreServices Foundation;
    inherit buildJdk runJdk bazelSelf buildJdkName;
  };
in
  build {
    version = "3.2.0";
    sha256 = "1ylbfdcb6rhnc3sr292c6shl754i0h0i050f4gr4bppn6sa15v24";
  }