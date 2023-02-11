{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
  };
  outputs =
    { self, nixpkgs, flake-utils, flake-compat }:
    flake-utils.lib.eachSystem [
      "x86_64-linux"
    ]
      (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        rec {
          devShells.default =
            pkgs.mkShell
              {
                packages = [
                  pkgs.rnix-lsp
                  pkgs.nixpkgs-fmt
                ];
              };
        }
      );
}
