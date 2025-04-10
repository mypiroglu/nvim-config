#!/bin/bash

echo "🔧 Neovim Setup Başlıyor..."

# Paket yöneticisi kontrolü
if ! command -v nvim &> /dev/null
then
    echo "Neovim yüklü değil. Lütfen yükleyin ve tekrar deneyin."
    exit
fi

# Plug indir
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Config klasörünü oluştur
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/init.vim

# Prettier kur
npm install -g prettier

# İlk eklenti kurulumu
nvim +PlugInstall +qall

echo "✅ Kurulum tamam! Neovim kullanmaya hazırsın."

