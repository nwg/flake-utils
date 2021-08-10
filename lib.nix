{ nixpkgs, numtide-flake-utils }:
let
  lib = nixpkgs.lib;
  numtide = numtide-flake-utils.lib;
  defaultSystems = numtide.defaultSystems;
  allSystems = numtide.allSystems;

  forSystems = systems: f: lib.genAttrs systems (system: f system);
  forDefaultSystems = forSystems defaultSystems;
  forAllSystems = forSystems allSystems;

in {
  inherit defaultSystems allSystems numtide forSystems forDefaultSystems forAllSystems;
}
