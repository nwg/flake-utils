{
  description = "My nixpkgs utils";

  inputs.numtide-flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, numtide-flake-utils }: {
    lib = import ./lib.nix { inherit nixpkgs numtide-flake-utils; };
  };
}
