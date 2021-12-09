{
  description = "My nixpkgs utils";

  outputs = { self, nixpkgs }: let lib = nixpkgs.lib; in {
    lib = lib.extend (final: prev: {
      nwg = import ./lib { lib = prev; };
    });
  };
}
