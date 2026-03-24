{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          autoindent = true;
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
        };

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        lsp.enable = true;
        lsp.servers.nixd.settings.nil.nix.autoArchive = true;
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          rust.enable = true;
          clang.enable = true;
          python.enable = true;
          markdown = {
            enable = true;
            extensions.markview-nvim.enable = true;
          };
        };

        autocmds = [
          {
            event = [ "FileType" ];
            pattern = [ "markdown" ];
            command = ''
              setlocal tabstop=2
              setlocal shiftwidth=2
              setlocal expandtab
            '';
          }
        ];
      

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
