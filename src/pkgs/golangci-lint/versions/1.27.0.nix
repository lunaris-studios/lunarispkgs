{ callPackage }:

let
  build = callPackage ../golangci-lint.nix {};
in
  build {
    version = "1.27.0";
    sha256 = "1capiw8af4wmx3wpfslb30xivfyh72x5kj12f8p5pwhl6id31931";
    vendorSha256 = "16wr8ixicbvdpg5mg6q07sa1b03ydpwdbvbjl3r9qihdqkhhzlr1";
  } 