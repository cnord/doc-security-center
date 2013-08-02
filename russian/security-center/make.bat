pandoc --template template/template-install.latex -V lang=russian -o SC4-InstallationManual-Rus.pdf 01-introduction.md 02-installation.md

pandoc --template template/template-manual.latex -V lang=russian -o SC4-UserManual-Rus.pdf *.md