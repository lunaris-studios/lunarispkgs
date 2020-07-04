{ callPackage }:

let
  build = callPackage ../skaffold.nix { };
in
  build {
    version = "1.11.0";
    revision = "931a70a6334436735bfc4ff7633232dd5fc73cc1";
    sha256 = "035xp34m8kzb75mivgf3kw026n2h6g2a7j2mi32nxl1a794w36zi";
  }