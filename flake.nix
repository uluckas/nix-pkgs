{
  description = "Nix configurations for custom packages";

  outputs = { self, nixpkgs }: {
    packages = {
      default = { system }: let
        pkgs = import nixpkgs { inherit system; };
      in
        {
          lookbusy = pkgs.callPackage ./lookbusy.nix { };
        };
    };
  };
