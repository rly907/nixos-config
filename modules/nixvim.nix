{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    colorscheme = "gruvbox";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    plugins = {
      treesitter.enable = true;
      lualine.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
    };
  };
}

