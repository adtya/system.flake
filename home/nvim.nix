{ pkgs, ... }:

{
  imports = [
  ];

  home-manager.users.adtya = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        {
          plugin = vim-airline;
          config = ''
            let g:airline_theme='dracula'
            let g:airline#extensions#tabline#enabled=1
            let g:airline#extensions#tabline#formatter='unique_tail_improved'
            let g:airline_powerline_fonts = 1
          '';
        }
        vim-airline-themes
        dracula-vim
        rust-vim
      ];
      extraConfig = ''
        set number
        set relativenumber
        set noswapfile
        set smartindent
        set noexpandtab
        set tabstop=2
        set shiftwidth=2
        set laststatus=2
        set noshowmode
        set clipboard+=unnamedplus
        set wrap
        set list
        set autowrite
        set background=dark
        colorscheme dracula
        nmap <C-a> gT
        nmap <C-d> gt
        nmap <C-h> :noh<Return>
        " vim-go
        " map <C-n> :cnext<CR>
        " map <C-m> :cprevious<CR>
        " nnoremap <leader>a :cclose<CR>
        " autocmd FileType go map <leader>b <Plug>(go-build)
        " autocmd FileType go map <leader>r <Plug>(go-run)
        " autocmd FileType go map <leader>f <Plug>(go-def)
        " autocmd FileType go map <leader>b <Plug>(go-def-pop)

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
  };
}
