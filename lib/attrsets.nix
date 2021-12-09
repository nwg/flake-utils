{ lib }: {
  inherit (builtins) elemAt;
  inherit (lib) sublist drop;

  listMakeMajor = n: lst: [ (elemAt lst n) ]
                            ++ sublist 0 n lst
                            ++ drop (n + 1) lst;

  mapAttrPaths = f: set:
    let
      pvPairsAttr = lib.mapAttrsRecursive (path: value: { inherit path value; }) set;
      pvPairsList = lib.collect (x: x ? path) pvPairsAttr;
      mapped = map (e: (e // { path = f e.path; })) pvPairsList;
      attrsList = map (e: (lib.setAttrByPath e.path e.value)) mapped;
    in
      lib.foldr lib.recursiveUpdate {} attrsList;

  promoteAttrsPathIndex = n: mapAttrPaths (listMakeMajor n);
}
