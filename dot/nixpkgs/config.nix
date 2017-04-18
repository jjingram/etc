let
  pkgs = import <nixpkgs> { };
in {
  packageOverrides = pkgs: with pkgs; rec {
    bash = pkgs.bash.override {
      interactive = true;
    };

    jji = pkgs.buildEnv {
      name = "jji";
      paths = [
        bash
        nix-prefetch-git
        cabal-install
      ];
    };
  };
}
