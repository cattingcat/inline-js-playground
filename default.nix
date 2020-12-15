{
  nixpkgs ? import <nixpkgs> {},
  hc ? "ghc8102Binary"
}:

let
  pkgs = [
    nixpkgs.nodejs
    nixpkgs.haskell.compiler.${hc}
    nixpkgs.cabal-install
    nixpkgs.pkgconfig
    nixpkgs.which
  ];
 
in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
  }