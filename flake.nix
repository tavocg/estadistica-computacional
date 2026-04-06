{
  description = "Jupyter notebook dev shell with matplotlib, numpy, scipy, pandas";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        pythonEnv = pkgs.python3.withPackages (ps: with ps; [
          jupyter
          notebook
          matplotlib
          numpy
          scipy
          pandas
          ipykernel
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pythonEnv ];

          shellHook = ''
            echo "🐍 Jupyter environment ready!"
            echo "Run: jupyter notebook"
          '';
        };
      });
}
