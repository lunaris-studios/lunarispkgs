{ stdenv, buildGoModule, fetchFromGitHub, installShellFiles }:

{ version, sha256 } @args:

buildGoModule rec {
  inherit version;
  
  pname = "helm";

  src = fetchFromGitHub {
    inherit sha256;

    owner = "helm";
    repo = "helm";
    rev = "v${version}";
  };
  vendorSha256 = "0j25m56cwzjd9b75v7xlb26q81bsmln77k23h9n8v2f2gqwwpkrl";

  subPackages = [ "cmd/helm" ];
  buildFlagsArray = [ "-ldflags=-w -s -X helm.sh/helm/v3/internal/version.version=v${version}" ];

  nativeBuildInputs = [ installShellFiles ];
  postInstall = ''
    $out/bin/helm completion bash > helm.bash
    $out/bin/helm completion zsh > helm.zsh
    installShellCompletion helm.{bash,zsh}
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/kubernetes/helm";
    description = "A package manager for kubernetes";
    license = licenses.asl20;
  };
}