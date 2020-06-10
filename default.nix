{ packages ? import ./packages {} }:
{
  inherit (packages)
    skaffold_1_10_1
    skaffold_1_10_0
    skaffold

    nodejs_10_19_0
    nodejs
    ;
}