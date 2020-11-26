{ callPackage
, buildHashiCorpPackage }:

let
  build = callPackage ../default.nix {
    inherit buildHashiCorpPackage;
  };
in
  build {
    version = "0.10.9";
    sha256 = "0khlkbh4j45kxxmf9dbil3y5l2v81xljli27wgr52v8d9c1krf55";
  }