{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = inputs@{ self, nixpkgs, nixos-hardware, ... }: {
    nixosConfigurations.e14 = nixpkgs.lib.nixosSystem {
      modules = [
	./configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
      ];
    };
  };
}

