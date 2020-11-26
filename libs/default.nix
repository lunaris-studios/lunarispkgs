{ nixpkgs ? import ../nix {} }:

with nixpkgs;
let 
  library = domain: name: { ... } @args: callPackage (./. + "/${domain}/${name}.nix") ( args // {} );
in
rec {
  # <hashi-corp>
  buildHashiCorpPackage = library "hashi-corp" "build-hashi-corp-package";
}
