1.
curl "https://raw.githubusercontent.com/Witcher42/vim/master/script.sh" | bash -s install

2.give the script.sh on a web server.then everyone in lan can use #1 to install or do other things

3.
document: script.sh:

#!/bin/sh

install() {
  if [ -d "$HOME/.vim" ]; then
    mv ~/.vim ~/.vim.`date +%Y%m%d%H%M%S`
  fi

  git clone https://github.com/Witcher42/vim ~/.vim

  if [ -f "$HOME/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc.`date +%Y%m%d%H%M%S`
  fi

  #ln -s ~/.vim/vimrc ~/.vimrc
  cp ~/.vim/vimrc.template ~/.vimrc

  cd ~/.vim

  git submodule init
  git submodule update

  vim +BundleInstall! +qall! </dev/tty

  #(cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer)
}

update() {
  (cd ~/.vim; git pull)
  vim +BundleClean +BundleInstall +qall! </dev/tty
}

for arg in "$@"
do
  case $arg in 
    install)
      install;
      break;
      ;;
    update)
      update;
      break;
      ;;
  esac
done
