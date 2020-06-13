{ nixpkgs ? import ./nix {} }:
with nixpkgs;
let
  package = p: v: { ... } @args: callPackage (./. + "/src/pkgs/${p}/versions/${v}.nix") ( args // {});
in
rec {
  go = go_1_14_2;
  go_1_14_2 = package "go" "1.14.2" {};

  google-cloud-sdk = google-cloud-sdk_268_0_0;
  google-cloud-sdk-gce = google-cloud-sdk-gce_268_0_0;
  google-cloud-sdk_268_0_0 = package "google-cloud-sdk" "268.0.0" {};
  google-cloud-sdk-gce_268_0_0 = google-cloud-sdk.override { withGce = true; };

  openjdk = openjdk_14;
  openjdk_headless = openjdk_14_headless;
  openjdk_14 = nixpkgs.pkgs.openjdk14;
  openjdk_14_headless = nixpkgs.pkgs.openjdk14_headless;  
  openjdk_11 = nixpkgs.pkgs.openjdk11;
  openjdk_11_headless = nixpkgs.pkgs.openjdk11_headless;
  openjdk_8 = nixpkgs.pkgs.openjdk8;
  openjdk_8_headless = nixpkgs.pkgs.openjdk8_headless;
  
  oraclejdk = oraclejdk_8;
  oraclejdk_8 = package "oraclejdk" "8" {};

  nodejs = nodejs_10_19_0;
  nodejs_10_19_0 = package "nodejs" "10.19.0" {};

  skaffold = skaffold_1_10_1;
  skaffold_1_10_1 = package "skaffold" "1.10.1" {};
  skaffold_1_10_0 = package "skaffold" "1.10.0" {};
}
