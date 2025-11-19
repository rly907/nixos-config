{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
    mako
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    kdePackages.dolphin
    fuzzel
    waybar
    swww
    waypaper
  ];

}
