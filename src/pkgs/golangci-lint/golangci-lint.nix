{ buildGoModule
, fetchFromGitHub
, lib }:

{ version
, sha256
, vendorSha256 } @args:

buildGoModule rec {
  inherit version;
  inherit vendorSha256;
  
  pname = "golangci-lint";

  src = fetchFromGitHub {
    inherit sha256;
    
    owner = "golangci";
    repo = "golangci-lint";
    rev = "v${version}";
  };

  subPackages = [ "cmd/golangci-lint" ];

  meta = with lib; {
    description = "Linters Runner for Go. 5x faster than gometalinter. Nice colored output.";
    homepage = "https://golangci.com/";
    license = licenses.agpl3;
    platforms = platforms.unix;
  };
}
