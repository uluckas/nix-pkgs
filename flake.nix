{
  description = "Nix configurations for custom packages";

  outputs = {self, nixpkgs, ...}@inputs: let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" "armv7l-linux" "armv6l-linux" ];
    forSupportedSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    legacyPackages = forSupportedSystems (system:
      import nixpkgs { inherit system; }
    );

    packages.default = forSupportedSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        lookbusy = pkgs.callPackage ./lookbusy/lookbusy.nix { };
      }
    );
  };
}