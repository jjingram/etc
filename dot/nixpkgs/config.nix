let
  pkgs = import <nixpkgs> { };
  allowUnfree = true;
in {
  packageOverrides = pkgs: with pkgs; rec {
    bash = pkgs.bash.override {
      interactive = true;
    };

    jji = pkgs.buildEnv {
      name = "jji";
      paths = [
        bash
        stack
        llvm_4
        bats
        irssi
      ];
    };
  };
}
