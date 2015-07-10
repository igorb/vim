# How to install?

     git clone git@github.com:igorb/vim.git ~/.vim
     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
     ln -s  ~/.vim/.vimrc ~/.vimrc

Open vim and run next command: `BundleInstall`

Then for command-t The C extension must be compiled:

     cd ~/.vim/bundle/Command-T/ruby/command-t
     ruby extconf.rb
     make
