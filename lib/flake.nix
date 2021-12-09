{ lib }:
let
  defaultSystems = lib.systems.supported.hydra;
  isOS = os: system: (lib.last (lib.splitString "-" system)) == os;
  isLinux = isOS "linux";
  justLinux = lib.filter isLinux;
  linuxSystems = justLinux allSystems;
  stdenvSystems = [
    "i686-linux"
    "x86_64-linux"
    "armv5tel-linux"
    "armv6l-linux"
    "armv6m-linux"
    "armv7a-linux"
    "armv7l-linux"
    "armv7r-linux"
    "armv7m-linux"
    "armv8a-linux"
    "armv8r-linux"
    "armv8m-linux"
    "aarch64-linux"
    "mipsel-linux"
    "powerpc-linux"
    "powerpc64-linux"
    "powerpc64le-linux"
    "x86_64-darwin"
    "aarch64-darwin"
    "x86_64-solaris"
    "i686-cygwin"
    "x86_64-cygwin"
    "x86_64-freebsd"
  ];
  stdenvLinuxSystems = justLinux stdenvSystems;

  # `nix flake check` is picky about overlay function arg names actually being final and prev
  composeOverlays = e1: e2: final: prev: ((lib.composeExtensions e1 e2) final prev);
  composeManyOverlays = overlays: final: prev: ((lib.composeManyExtensions overlays) final prev);

in {
  inherit
    isLinux
    isOS
    defaultSystems
    supportedSystems
    promoteAttrsPathIndex
    composeOverlays
    composeManyOverlays;
}
