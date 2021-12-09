{
  description = "My nixpkgs utils";

  inputs.numtide-flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, numtide-flake-utils }: {
    lib = import ./lib.nix { inherit nixpkgs numtide-flake-utils; };

    checks."aarch64-darwin".mytest = let
      np = import nixpkgs { system = "aarch64-darwin"; };

      test = let
        A = {
          "aarch64-darwin" = {
            packages = {
              a = "apackage";
              b = "bpackage";
            };
          };
          "x86_64-linux" = {
            packages = {
              a = "apackage";
              b = "bpackage";
              c = "cpackage";
            };
          };
        };
      in
        self.lib.promoteAttrsPathIndex 1 A;
    in
      np.pkgs.runCommand "mytest" {} ''
        mkdir -p "$out"
        echo "hello there"
        echo "${builtins.toString (builtins.toJSON test)}"
        exit 1
      '';


  };
}
