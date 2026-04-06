{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShells.default = { pkgs, ... }: pkgs.mkShell {
        buildInputs = [
          pkgs.chord
          (pkgs.python3.withPackages (ps: with ps; with pkgs.python3Packages; [
            jupyter
            notebook
            ipython
            pandas
            numpy
            scipy
            matplotlib
          ]))
        ];

        shellHook = "jupyter notebook";
      };
    };
}
