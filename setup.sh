#!/bin/bash

DOTFILES_DIR=$(pwd)

for file in $DOTFILES_DIR/.*; do
  if [[ $file == "$DOTFILES_DIR/." || $file == "$DOTFILES_DIR/.." || $file == "$DOTFILES_DIR/.git" || $file == "$DOTFILES_DIR/.gitignore" ]]; then
    continue
  fi

  filename=$(basename $file)

  if [ -e ~/$filename ]; then
    rm -rf ~/$filename
  fi

  ln -s $file ~/$filename
done

echo "シンボリックリンクの作成が完了しました。"
