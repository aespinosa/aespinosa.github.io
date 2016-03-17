let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  haskellPackages = pkgs.haskellPackages;
  darwin = pkgs.darwin;
in

stdenv.mkDerivation {
  name = "haskell-environment";
  buildInputs =  [ 
    (haskellPackages.ghcWithPackages (p: [ p.hakyll ] ))
    darwin.apple_sdk.frameworks.Cocoa
    pkgs.lessc
  ];
}
