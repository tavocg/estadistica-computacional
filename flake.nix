{
  description = "My development environment with Jupyter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells = {
        inherit system;
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.chord
            (pkgs.python3.withPackages (ps: with ps; with pkgs.python3Packages; [
              jupyter
              notebook
              ipython
              matplotlib
              numpy
              scipy
              pandas
            ]))
          ];

          shellHook = "jupyter notebook";
        };
      };
    };
}
