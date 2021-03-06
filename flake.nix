{
  description = ''Nim bindings for the WEBRTC VAD(voice actitvity Detection)'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."webrtcvad-master".dir   = "master";
  inputs."webrtcvad-master".owner = "nim-nix-pkgs";
  inputs."webrtcvad-master".ref   = "master";
  inputs."webrtcvad-master".repo  = "webrtcvad";
  inputs."webrtcvad-master".type  = "github";
  inputs."webrtcvad-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."webrtcvad-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}