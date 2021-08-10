{ nixpkgs, numtide-flake-utils }:
let
  lib = nixpkgs.lib;
  numtide = numtide-flake-utils.lib;
  defaultSystems = numtide.defaultSystems;
  allSystems = numtide.allSystems;

  forSystems = systems: f: lib.genAttrs systems (system: f system);
  forDefaultSystems = forSystems defaultSystems;
  forAllSystems = forSystems allSystems;

  # `nix flake check` is picky about overlay function arg names actually being final and prev
  composeOverlays = e1: e2: final: prev: lib.composeExtensions e1 e2;
  composeManyOverlays = e1: e2: final: prev: lib.composeManyExtensions e1 e2;

in {
  inherit
    defaultSystems
    allSystems
    numtide
    forSystems
    forDefaultSystems
    forAllSystems
    composeOverlays
    composeManyOverlays;
}
