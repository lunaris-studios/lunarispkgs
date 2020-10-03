{ callPackage }:

let
  build = callPackage ../default.nix { };
in
  build {
    version = "1.15.0";
    revision = "931a70a6334436735bfc4ff7633232dd5fc73cc1";
    sha256 = "0cir9ld61pq1rziw6vyz1ihkq0aylzrsxg1vqb9544rwnbq7z2qs";
  }