{
  description = "My nixpkgs utils";

  outputs = { self, ... }: {
    lib = import ./lib.nix;
  };
}
