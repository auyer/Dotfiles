" Specify a directory for plugins
" - For vim: ~/.vim/plugged
" - 
" - To Install Plug:
" - curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" - 
call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  Plug 'zchee/nvim-go', { 'do': 'make'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
  Plug 'jodosha/vim-godebug' " Debugger integration via delve
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
