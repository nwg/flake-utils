{ lib }:
let
  getPath = path: import path { inherit lib; };
  attrsets = getPath ./attrsets.nix;
  flake = getPath ./flake.nix;
in {
  inherit (attrsets)
    listMakeMajor
    mapAttrPaths
    promoteAttrsPathIndex;

  inherit (flake)
    isLinux
    isOS
    defaultSystems
    supportedSystems
    composeOverlays
    composeManyOverlays;

}
