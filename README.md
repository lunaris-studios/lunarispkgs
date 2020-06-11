<h1 align="center" style="border-bottom: none;">🌙📦 lunaris-pkgs</h1>
<h3 align="center">A Nix package channel for Lunaris Studios development</h3>
<p align="center">
  <a href="#badge">
    <img alt="semantic-release" src="https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg">
  </a>
</p>

**lunaris-pkgs** is a derivative of the [Nixpkgs](https://github.com/nixos/nixpkgs) collection - a collection of software packages that can be installed with the [Nix](https://nixos.org/nix/) package manager. In order to streamline development and CI pipelines at Lunaris Studios, we've implemented our own custom package channel quick and iterative development via **Nix**.

## Packages

| Packages   | Versions                                                                |
| ---------- | ----------------------------------------------------------------------- |
| `go`       | <ul><li><a href="./pkgs/go/go-10.19.0">1.14.2</a> (go_1_14_2)</li></ul>             |
| `nodejs`   | <ul><li><a href="./pkgs/nodejs/nodejs-10.19.0">10.19.0</a></li></ul>    |
| `skaffold` | <ul><li><a href="./pkgs/skaffold/skaffold-10.19.0">1.10.1</a></li></ul> |

## Get Started

1. [Install Nix](#installing-nix)
2. Install ***lunaris-pkgs*** for your environment
   - [Nix Channels](#nix-channels)
   - [Niv](#niv)

## Installing Nix

```bash
$ curl -L https://nixos.org/nix/install | sh
```

# Installation

## Nix Channels

Subscribe to the **lunaris-pkgs** custom channel

```bash
nix-channel --add https://nixos.org/channels/nixpkgs-unstable lunarispkgs
```

Import the channel in your derivations

```nix
lunarispkgs = import <lunarispkgs> {};
```

## Niv

`niv` is available in [nixpkgs](https://github.com/NixOS/nixpkgs) on the master branch as `niv`. It is also available on the release-19.09 branch as `haskellPackages.niv`. Otherwise, run:

```bash
nix-env -iA niv -f https://github.com/nmattia/niv/tarball/master \
    --substituters https://niv.cachix.org \
    --trusted-public-keys niv.cachix.org-1:X32PCg2e/zAm3/uD1ScqW2z/K0LtDyNV7RdaxIuLgQM=
```

If you're using `home-manager`, you can add it to your `home.nix` profile via the [nixpkgs](https://github.com/NixOS/nixpkgs) channel.

```nix
home.packages = with pkgs; [
  niv
  ...
];
```

In your project directory, run `niv init` to bootstrap `niv`. Now you can install latest version of `lunaris-pkgs` by running the following:

```bash
niv add lunaris-studios/lunaris-pkgs
```

This will pull directly fromt the `master` branch. You can target a specific branch by applying the `-b <BRANCH>` flag:

```bash
niv add lunaris-studios/lunaris-pkgs -b alpha
```

You can add a specific version of the collection via:

```bash
niv add lunaris-pkgs \
  -v 1.1.0-alpha.1 \
  -t "https://github.com/lunaris-studios/lunaris-pkgs/archive/v<version>.tar.gz"
```
