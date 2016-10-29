with import <nixpkgs> {};
let
  normalize = fetchurl {
    url =  "https://raw.githubusercontent.com/necolas/normalize.css/3.0.1/normalize.css";
    sha256 = "04xsqiacggsdbpvn3mv8azfh95rymn5lmmzjpml0cqm14czn3q4f";
  };
in


stdenv.mkDerivation {
  name = "espinosa-io";
  buildInputs =  [ 
    (haskellPackages.ghcWithPackages (p: [
      (p.hakyll.overrideDerivation (old: {
        doCheck = false;
      }))
    ] ))
    lessc
  ];
  inputs = [ normalize ];
  shellHook = ''
    ln -sf ${normalize} normalize.css
  '';
}
