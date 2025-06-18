{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation {
  name = "quickshell-config";

  buildInputs = with pkgs; [
    quickshell
  ];

  phases = [
    "installPhase"
  ];

  installPhase = ''
    mkdir -p $out
    cp -r . $out
  '';
}