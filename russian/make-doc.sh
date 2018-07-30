#!/bin/sh

START=$(date +%s)
 
pandoc --template template/template.latex -V title-source=title-install.tex -o SC5-Installation-Rus.pdf 01-introduction.md 02-installation.md
 
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Instalation manual – $DIFF seconds"

START=$(date +%s)

pandoc --template template/template.latex -V title-source=title-manual.tex -o SC5-UserManual-Rus.pdf 00-whats-new.md 01-introduction.md 02-installation.md 03-getting-started.md 04-event-manager.md 05-object-manager.md 06-system-setup.md 07-personnel-manager.md 08-maps-of-objects.md 09-duty-operator.md 10-report-manager.md 11-database-wizard.md 12-cloud-services.md 13-outro.md
#pandoc --template template/template.latex -V title-source=title-manual.tex -o SC5-UserManual-Rus.pdf 05-object-manager.md 06-system-setup.md 

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "User manual – $DIFF seconds"

