{ callPackage }:
let
  buildK9s = callPackage ../k9s.nix {};
in
  buildK9s {
    version = "0.19.4";
    sha256 = "1ya3lrw31pxd1rxzf88l5hzilaxwrng1a3ibawgn57my333hrmf6";
  }