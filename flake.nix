{
  description = "A very basic flake";

  inputs = {
  nixpkgs.url = "nixpkgs/nixos-22.11";
  generators.url = "github:nix-community/nixos-generators";
  generators.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, generators }: let
    pkgs = import nixpkgs {
      crossSystem.config = "aarch64-unknown-linux-gnu";
    };
    in
  {

  packages.x86_64-linux = {
    printer = generators.nixosGenerate {
      system = "sd-aarch64";
      format = "iso";
      modules = [];
    };
    coffeeMaker = generators.nixosGenerate {
      system = "aarch64-linux";
      format = "docker";
      modules = [];      
    };
    octoprint = generators.nixosGenerate {};
    smartMirror = generators.nixosGenerate {};
  };

};
}
