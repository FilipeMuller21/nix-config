{ pkgs, config, inputs, ... }: {

programs.nixvim = {
  enable = true;
  colorschemes.catppuccin.enable = true; # combina com seu setup atual
  plugins = {
    lsp = {
      enable = true;
      servers = {
        omnisharp = { 
	  enable = true; 
	};
        nixd.enable = true;
        rust-analyzer.enable = true;
      };
    };
    telescope.enable = true;
    treesitter.enable = true;
    cmp.enable = true;
    nvim-tree.enable = true;
    lualine.enable = true;
    gitsigns.enable = true;
    };
    treesitter = {
      enable = true;
      settings.ensure_installed = [ "c_sharp" "sql" "lua" "nix" ];
	    };
  };
  
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
  vim-dadbod
  vim-dadbod-ui
];
}
