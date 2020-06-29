{ callPackage }:
let
  buildJq = callPackage ../jq.nix {};
in
  buildJq {
    version = "1.6";
    sha256 = "0wmapfskhzfwranf6515nzmm84r7kwljgfs7dg6bjgxakbicis2x";
  }