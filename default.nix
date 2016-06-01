with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "haskell-environment";
  buildInputs =  [ 
    (haskellPackages.ghcWithPackages (p: [
      (p.hakyll.overrideDerivation (old: {
        doCheck = false;
      }))
    ] ))
    darwin.apple_sdk.frameworks.Cocoa
    pkgs.nodePackages.less
  ];
}
