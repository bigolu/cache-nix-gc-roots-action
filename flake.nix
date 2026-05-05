{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    blueprint = { url = "github:numtide/blueprint"; inputs.nixpkgs.follows = "nixpkgs"; };
    devshell = { url = "github:numtide/devshell"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-compat.url = "https://git.lix.systems/lix-project/flake-compat/archive/main.tar.gz";
    devshell-modules.url = "github:bigolu/devshell-modules";
  };

  outputs = inputs: inputs.blueprint { inherit inputs; prefix = "nix"; };
}
