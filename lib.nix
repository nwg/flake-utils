{ lib }:
let
  defaultSystems = [
    "aarch64-linux"
    "i686-linux"
    "x86_64-darwin"
    "x86_64-linux"
  ];

  forAllSystems = f: lib.genAttrs defaultSystems (system: f system);

  lib = {
    inherit
      defaultSystems;
  };
in
  lib
