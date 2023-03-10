{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    extraPackages = with pkgs; [
      rnix-lsp
      tree-sitter
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = ''
          require("bufferline").setup{}
        '';
      }
      dracula-nvim
      {
        plugin = nvim-lastplace;
        type = "lua";
        config = ''
          require'nvim-lastplace'.setup{}
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          require'lspconfig'.gopls.setup{}
          require'lspconfig'.rnix.setup{}
          require'lspconfig'.rust_analyzer.setup{}
        '';
      }
      (nvim-treesitter.withPlugins (plugins: with plugins; [ bash dockerfile gitcommit gitignore git_rebase go markdown markdown_inline nix rust toml yaml ]))
      nvim-treesitter-context
      nvim-treesitter-refactor
      {
        plugin = lualine-nvim;
        config = ''
          require'lualine'.setup() {
            options = {
              icons_enabled = true,
              theme = 'dracula'
            }
          }
        '';
      }
      vim-devicons
      vim-fugitive
      vim-gitgutter
      vim-go
      vim-nix
      rust-vim
    ];
    extraConfig = ''
      set autowrite
      set background=dark
      set clipboard+=unnamedplus
      set expandtab
      set laststatus=2
      set list
      set noshowmode
      set noswapfile
      set number
      set relativenumber
      set shiftwidth=2
      set signcolumn=yes
      set smartindent
      set tabstop=2
      set termguicolors
      set updatetime=100
      set wrap

      colorscheme dracula

      nmap <C-a> gT
      nmap <C-d> gt
      nmap <C-h> :noh<Return>
      nmap <leader>1 1gt
      nmap <leader>2 2gt
      nmap <leader>3 3gt
      nmap <leader>4 4gt
      nmap <leader>5 5gt
      nmap <leader>6 6gt
      nmap <leader>7 7gt
      nmap <leader>8 8gt
      nmap <leader>9 9gt
      nmap <leader>0 0gt
    '';
  };
}
