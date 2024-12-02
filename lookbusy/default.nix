# default.nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
  pkgs = import nixpkgs { };
in
{
  lookbusy = pkgs.callPackage ./lookbusy.nix { };
}
