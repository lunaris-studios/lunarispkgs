{ stdenv, buildGoModule, fetchFromGitHub }:

{ version, sha256 } @args:

buildGoModule rec {
  inherit version;
  pname = "k9s";

  src = fetchFromGitHub {
    inherit sha256;

    owner  = "derailed";
    repo   = "k9s";
    rev    = "v${version}";
  };

  buildFlagsArray = ''
    -ldflags=
      -s -w
      -X github.com/derailed/k9s/cmd.version=${version}
      -X github.com/derailed/k9s/cmd.commit=${src.rev}
  '';

  vendorSha256 = "0vvzv5v7j77v809h2ial9n23244j1sy3xhkarsv0wwkifc3swvq5";

  meta = with stdenv.lib; {
    description = "Kubernetes CLI To Manage Your Clusters In Style.";
    homepage = "https://github.com/derailed/k9s";
    license = licenses.asl20;
  };
}