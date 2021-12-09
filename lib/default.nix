{ lib }:
let
  getPath = path: import path { inherit lib; };
in {
  attrsets = getPath ./attrsets.nix;
  flake = getPath ./flake.nix;
}
