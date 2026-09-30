{
  description = "NixOS, btw";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }:
  let
    system = "x86_64-linux";
    hostname = "s4yok";
    username = "s4yok";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit pkgs-stable username hostname;
      };

      modules = [
        ./hosts/laptop/configuration.nix
	./modules
	
	home-manager.nixosModules.home-manager

	{
	  nixpkgs.config.allowUnfree = true;

	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;

	    users.${username}.imports = [
	      ./home-manager/home.nix
	    ];

	    extraSpecialArgs = {
	      inherit pkgs-stable hostname username;
	    };
	  };
	}
      ];
    };
  };
}
