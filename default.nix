with import <nixpkgs> {};

let
  simplePackage = pkgs.writeShellScriptBin "lolsay" ''
  nix-shell -p lolcat --run "echo $1 | lolcat"
  '';
in
stdenv.mkDerivation rec {
  name = "Hello-Derivation";

  buildInputs = [ simplePackage ];
}
