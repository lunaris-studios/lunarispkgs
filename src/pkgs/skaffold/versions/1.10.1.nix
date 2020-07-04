{ callPackage }:

let
  build = callPackage ../skaffold.nix { };
in
  build {
    version = "1.10.1";
    revision = "931a70a6334436735bfc4ff7633232dd5fc73cc1";
    sha256 = "1qi4b0304jjpv5npa5yfrrfg7yv5p838qqql3sgx4f47ysyyq0as";
  }
