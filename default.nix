with import <nixpkgs> {};

let
  # This is the WORST way to do dependencies
  # We just specify the derivation the same way as before
  simplePackage = pkgs.writeShellScriptBin "lol-test" ''
  nix-shell -p lolcat --run "echo $1 | lolcat"
  '';
in
stdenv.mkDerivation rec {
  name = "test-environment";

  # Then we add curl & jq to the list of buildInputs for the shell
  # So curl and jq will be added to the PATH inside the shell
  buildInputs = [ simplePackage pkgs.jq pkgs.curl ];
}
