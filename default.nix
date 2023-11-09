with import <nixpkgs> {};

let
  simplePackage = pkgs.writeShellScriptBin "lol-test" ''
  nix-shell -p lolcat --run "echo $1 | lolcat"
  '';
in
stdenv.mkDerivation rec {
  name = "test-environment";

  buildInputs = [ simplePackage ];
}
