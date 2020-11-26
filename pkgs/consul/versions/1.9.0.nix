{ callPackage
, buildHashiCorpPackage }:

let
  build = callPackage ../default.nix {
    inherit buildHashiCorpPackage;
  };
in
  build {
    version = "1.9.0";
    sha256 = "0bhkzkkb5mi7knc0vp08h1s1xwyzpbl0v4clmi9rswia3ha6m9yq";
  }