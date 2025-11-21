{ config, pkgs, lib, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-config/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
      niri = "niri";
      kitty = "kitty";
      waybar = "waybar";
      fuzzel = "fuzzel";
    };
in 


{

    imports = [
    ./modules/nixvim.nix
    ./modules/niri.nix
    ];

    programs.git = {
        enable = true;
        userName = "Riley";
        userEmail = "rly907@gmail.com";
      };

    home.username = "rly907";
    home.homeDirectory = "/home/rly907";
    home.stateVersion = "25.05";
    programs.fish = {
        shellAliases = {
            w-nix = "echo nixos rebuild switch, w nixos";
        };
    };
    xdg.configFile = builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
      }) configs;
    
    home.packages = with pkgs; [
        gcc
    ];


    
}
