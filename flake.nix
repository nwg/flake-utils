{
  description = "My nixpkgs utils";

  outputs = { self, nixpkgs }: {
    lib = import ./lib.nix { lib = nixpkgs.lib; };
  };
}
