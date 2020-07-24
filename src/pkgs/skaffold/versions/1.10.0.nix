{ callPackage }:

let
  build = callPackage ../default.nix { };
in
  build {
    version = "1.10.0";
    revision = "35f0bc4775398c5049c74675c32bdeca51b41587";
    sha256 = "0kyny0drnsk5hl2hfbvn1rkw34dgh2cbjv44c7v5h0sd7lpvyvq6";
  }