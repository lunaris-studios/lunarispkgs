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

## Installing Nix

```bash
$ curl -L https://nixos.org/nix/install | sh
```

## Usage

Subscribe to the **lunaris-pkgs** custom channel

```bash
nix-channel --add https://nixos.org/channels/nixpkgs-unstable lunarispkgs
```

Import the channel in your derivations

```nix
lunarispkgs = import <lunarispkgs> {};
```
