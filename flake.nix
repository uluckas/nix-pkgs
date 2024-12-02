{
  description = "Nix configurations for custom packages";

  outputs = { self, nixpkgs }: {
    supportedSystems = [ "x86_64-linux" "aarch64-linux" "armv7l-linux" "armv6l-linux" ];
    legacyPackages = builtins.genAttrs supportedSystems (system:
      import nixpkgs { inherit system; }
    );

    # Dynamically support architectures for packages
    packages.default = builtins.genAttrs supportedSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        lookbusy = pkgs.callPackage ./lookbusy.nix { };
      }
    );
  };
}
