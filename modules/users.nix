{ pkgs, inputs, ... }:

{
  users.users.tsora = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
    packages = with pkgs; [
      tree
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "before-declarative";
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.tsora = {
      imports = [
        ../home/default.nix
        inputs.plasma-manager.homeModules.plasma-manager
      ];
    };
  };
}
