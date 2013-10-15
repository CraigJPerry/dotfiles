### Keybindings ###
No default keybindings have been disabled. Some extra keybindings have
been added:

Leader is set to `,`


#### Normal Mode Keybindings ####

* `<F2>` Toggle Paste Mode
* `Y` copies to end of line (for consistency with C & D commands)
* `<SPACE>` Clears any highlights or status messages in the buffer
* `<leader>8` goes to the 79th column of text 
* `Control-Shift-u` Drag current line up 1 line
* `Control-Shift-d` Drag current line down 1 line
* `<leader>jp` validates & reformats a buffer containing JSON

#### Insert Mode Keybindings ####

* `<F2>` Toggle Paste Mode
* `Control-Shift-u` Drag current line up 1 line
* `Control-Shift-d` Drag current line down 1 line

#### Visual Mode Keybindings ####

* `Control-Shift-u` Drag current line up 1 line
* `Control-Shift-d` Drag current line down 1 line
* `*` searches forward for selected word
* `#` searches backward for selected word

#### Ex Mode Keybindings ####

* `:Q` performs same function as :q (since i typo this all the time!)
* `Control-a` goes to start of line (like bash / readline in emacs mode)
* `Control-e` goes to end of line
* `Control-w` delete word to the left of cursor


### Plugins ###
Plugins are managed by [Vundle](https://github.com/gmarik/vundle).

> The movein script ensures git is installed (a dependency for Vundle)

* [Easy Motion](https://github.com/Lokaltog/vim-easymotion)
* [VIM Colorschemes](https://github.com/flazz/vim-colorschemes)
* [UltiSnips](https://launchpad.net/ultisnips)
* [Syntastic](https://github.com/scrooloose/syntastic) 
* [VIM Surround](https://github.com/tpope/vim-surround)
* [VIM CF3](https://github.com/neilhwatson/vim_cf3)

  Configured with an auto command to unfold all folds in .cf files.
  Also enables the plugin's keyword abbreviation expansion feature.


#### Disabled Plugins ####
Due to external dependencies that can't be (easily) met on all
platforms, the following are disabled but with configuration
readily available. This makes it painless to enable these where
possible.

* [VIM Airline](https://github.com/bling/vim-airline)
* [YouCompleteMe](http://val.markovic.io/blog/youcompleteme-a-fast-as-you-type-fuzzy-search-code-completion-engine-for-vim)

