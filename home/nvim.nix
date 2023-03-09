{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      rnix-lsp
    ];
    plugins = with pkgs.vimPlugins; [
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
          require'lspconfig'.rnix.setup{}
        '';
      }
      (nvim-treesitter.withPlugins (plugins: [ plugins.nix ]))
      nvim-treesitter-context
      nvim-treesitter-refactor
      {
        plugin = vim-airline;
        config = ''
          let g:airline_theme='term'
          let g:airline#extensions#tabline#enabled=1
          let g:airline#extensions#tabline#formatter='unique_tail_improved'
          let g:airline_powerline_fonts = 1
        '';
      }
      vim-airline-themes
      vim-devicons
      vim-fugitive
      vim-gitgutter
      vim-nix
    ];
    extraConfig = ''
      set number
      set relativenumber
      set noswapfile
      set smartindent
      set expandtab
      set tabstop=2
      set shiftwidth=2
      set laststatus=2
      set noshowmode
      set clipboard+=unnamedplus
      set wrap
      set list
      set autowrite
      set background=dark
      set updatetime=100
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
      nmap <leader>ce :tabnew $MYVIMRC<Return>
      nmap <leader>cu :source $MYVIMRC<Return>
    '';
  };
}
