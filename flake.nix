{
  description = "quickshell configuration";

  inputs = {
    quickshell = {
      # remove ?ref=v0.1.0 to track the master branch
      url = "git+https://github.com/quickshell-mirror/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, quickshell, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.default = (import ./default.nix { inherit pkgs; });
  };
}