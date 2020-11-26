{ nixpkgs ? import ../nix {} }:

with nixpkgs;
let 
  util = domain: name: { ... } @args: callPackage (./. + "/${domain}/${name}.nix") ( args // {} );
in
rec {
  # <hashi-corp>
  buildHashiCorpPackage = util "hashi-corp" "build-hashi-corp-package";
}
