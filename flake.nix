{
  description = "Nix configurations for custom packages";

  outputs = { self, nixpkgs, ... }: {
    packages.x86_64-linux.lookbusy = import ./lookbusy/default.nix;
  };
}
