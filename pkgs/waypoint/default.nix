{ buildHashiCorpPackage }:

{ version
, sha256 } @args:

buildHashiCorpPackage rec {
  inherit
    version
    sha256
  ;
  name = "waypoint";
}
