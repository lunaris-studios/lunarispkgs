{ callPackage }:

let
  build = callPackage ../default.nix {};
in
  build {
    version = "3.4.1";
    sha256 = "13w0s11319qg9mmmxc24mlj0hrp0r529p3ny4gfzsl0vn3qzd6i2";
  }