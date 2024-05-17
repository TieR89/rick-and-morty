#!/usr/bin/env sh

# остановка выполнения при ошибках
set -e

# сборка
npm run build

# переход в каталог сборки
cd dist

# если вы деплоите на пользовательский домен
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# если деплой по адресу https://TieR89.github.io
# git push -f git@github.com:TieR89/TieR89.github.io.git main

# если деплой по адресу https://TieR89.github.io/rick-and-morty
git push -f git@github.com:TieR89/rick-and-morty.git master:gh-pages

cd -
