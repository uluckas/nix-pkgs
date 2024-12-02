{
  description = "Nix configurations for custom packages";

  outputs = { self, nixpkgs, ... }: {
    packages.x86_64-linux.lookbusy = import ./lookbusy/default.nix;
    packages.aarch64-linux.lookbusy = import ./lookbusy/default.nix;
    packages.armv7l-linux.lookbusy = import ./lookbusy/default.nix;
    packages.armv6l-linux.lookbusy = import ./lookbusy/default.nix;
  };
}
