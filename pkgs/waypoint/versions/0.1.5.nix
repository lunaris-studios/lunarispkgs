{ callPackage
, buildHashiCorpPackage }:

let
  build = callPackage ../default.nix {
    inherit buildHashiCorpPackage;
  };
in
  build {
    version = "0.1.5";
    sha256 = "0cir9ld61pq1rziw6vyz1ihkq0aylzrsxg1vqb9544rwnbq7z2qs";
  }