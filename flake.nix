{
  description =
    "Raspberry pi's configurations, run with `nix build .#images.{name}`";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    betapkgs.url = "nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs, betapkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        hostPlatform.system = "armv6l-linux";
        buildPlatform.system = system;
      };
      betaPkgs = import betapkgs {
        inherit system;
        crossSystem.config = "armv6l-unknown-linux-gnueabihf";
      };
    in {

      nixosConfigurations.printer = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit pkgs; };
        modules = [ ./printerConfiguration.nix ];
      };

      images.printer =
        self.nixosConfigurations.printer.config.system.build.sdImage;

    };

}
