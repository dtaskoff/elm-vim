# elm-vim
Elm plugin for Vim

## Features
* syntax highlighting
* elm-format on save

## Setup
* [pathogen](https://github.com/tpope/vim-pathogen)
    * `git clone https://github.com/dtaskoff/elm-vim.git ~/.vim/bundle/elm-vim`

## Options
* `elm_highlight_types` - distinguish types from other identifiers when highlighting (on by default)
    * turn it off with adding `let elm_highlight_types=0` to your `.vimrc`
