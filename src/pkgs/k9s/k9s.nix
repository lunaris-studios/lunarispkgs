{ stdenv
, buildGoModule
, fetchFromGitHub }:

{ version
, sha256
, vendorSha256 } @args:

buildGoModule rec {
  inherit 
    version
    vendorSha256
  ;
  
  pname = "k9s";

  src = fetchFromGitHub {
    inherit 
      sha256
    ;

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

  meta = with stdenv.lib; {
    description = "Kubernetes CLI To Manage Your Clusters In Style.";
    homepage = "https://github.com/derailed/k9s";
    license = licenses.asl20;
  };
}