{ callPackage
, buildHashiCorpPackage }:

let
  build = callPackage ../default.nix {
    inherit buildHashiCorpPackage;
  };
in
  build {
    version = "0.10.9";
    sha256 = "10n8scr7x7mdi09pigv8r1vzzpf4y8i1yj5j1xslgbapdwcy8dzb";
  }