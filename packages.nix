{ nixpkgs ? import ./nix {}
, util ? import ./util {} }:
with nixpkgs;
let
  package = package: version: { ... } @args: callPackage (./. + "/pkgs/${package}/versions/${version}.nix") ( args // {} );
in
rec {
  bazel = bazel_3_2_0;
  bazel_3_2_0 = package "bazel" "3.2.0" {
    buildJdk = openjdk_8;
    buildJdkName = "jdk8";
    runJdk = openjdk_11_headless;
    bazelSelf = bazel_3_2_0;
  };

  # === consul ===

  consul = consul_1_9_0;
  consul_1_9_0 = package "consul" "1.9.0" {
    buildHashiCorpPackage = util.buildHashiCorpPackage;
  };

  # === go ===

  go = go_1_14_4;
  go_1_14_4 = nixpkgs.pkgs.go_1_14;

  # === golangci-lint ===

  golangci-lint = golangci-lint_1_27_0;
  golangci-lint_1_27_0 = package "golangci-lint" "1.27.0" {};

  # === google-cloud-sdk ===

  google-cloud-sdk = google-cloud-sdk_268_0_0;
  google-cloud-sdk-gce = google-cloud-sdk-gce_268_0_0;
  google-cloud-sdk_268_0_0 = package "google-cloud-sdk" "268.0.0" {};
  google-cloud-sdk-gce_268_0_0 = google-cloud-sdk.override { withGce = true; };

  # === helm ===
  
  helm = helm_3_4_1;
  helm_3_4_1 = package "helm" "3.4.1" {};
  
  # === jq ===

  jq = jq_1_6;
  jq_1_6 = package "jq" "1.6" {};

  # === k9s ===

  k9s = k9s_0_19_4;
  k9s_0_19_4 = package "k9s" "0.19.4" {};

  # === mirror ===
  
  mirror = mirror_1_0_2;
  mirror_1_0_2 = package "mirror" "1.0.2" {};

  # === nodejs ===
  
  nodejs = nodejs_12_18_3;
  nodejs_12_18_3 = package "nodejs" "12.18.3" {};
  nodejs_10_19_0 = package "nodejs" "10.19.0" {};

  # === nomad ===

  nomad = nomad_0_10_9;
  nomad_0_10_9 = package "nomad" "0.10.9" {
    buildHashiCorpPackage = util.buildHashiCorpPackage;
  };

  # === openjdk ===

  openjdk = openjdk_14;
  openjdk_headless = openjdk_14_headless;
  openjdk_14 = nixpkgs.pkgs.openjdk14;
  openjdk_14_headless = nixpkgs.pkgs.openjdk14_headless;  
  openjdk_11 = nixpkgs.pkgs.openjdk11;
  openjdk_11_headless = nixpkgs.pkgs.openjdk11_headless;
  openjdk_8 = nixpkgs.pkgs.openjdk8;
  openjdk_8_headless = nixpkgs.pkgs.openjdk8_headless; 

  # === python ===

  python = python_3_7_7;
  python_3_7_7 = nixpkgs.pkgs.python37;

  # === rust ===

  cargo = cargo_1_43_0;
  cargo_1_43_0 = rust_1_45_2_packages.cargo;

  clippy = clippy_1_43_0;
  clippy_1_43_0 = rust_1_45_2_packages.clippy;

  rust = rust_1_45_2;
  rust_packages = rust.packages.stable;
  rust_1_45_2 = nixpkgs.pkgs.rust_1_45;
  rust_1_45_2_packages = rust_1_45.packages.stable;

  rustc = rustc_1_45_2;
  rustc_1_45_2 = rust_1_45_2_packages.rustc;

  # === skaffold ===

  skaffold = skaffold_1_15_0;
  skaffold_1_15_0 = package "skaffold" "1.15.0" {};
  skaffold_1_11_0 = package "skaffold" "1.11.0" {};
  skaffold_1_10_1 = package "skaffold" "1.10.1" {};
  skaffold_1_10_0 = package "skaffold" "1.10.0" {};

  # === waypoint ===

  waypoint = waypoint_0_1_5;
  waypoint_0_1_5 = package "waypoint" "0.1.5" {
    buildHashiCorpPackage = util.buildHashiCorpPackage;
  };
}
   