{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        lsp.enable = true;
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          rust.enable = true;
        };
      

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
