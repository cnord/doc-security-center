#!/bin/sh

START=$(date +%s)
 
# pandoc --template template/template.latex -V title-source=title-install.tex -o sc5-installation-rus.pdf 01-introduction.md 02-installation.md
 
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian instalation manual – $DIFF seconds"

START=$(date +%s)

# pandoc --template template/template.latex -V title-source=title-manual.tex -o sc5-usermanual-rus.pdf 00-whats-new.md 01-introduction.md 02-installation.md 03-getting-started.md 04-event-manager.md 05-object-manager.md 06-system-setup.md 07-personnel-manager.md 08-maps-of-objects.md 09-duty-operator.md 10-report-manager.md 11-database-wizard.md 12-cloud-services.md 13-outro.md

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian user manual – $DIFF seconds"

START=$(date +%s)

pandoc --template template/template.latex -V title-source=title-http-api.tex -o sc5-http-api-rus.pdf 14-api-01-intro.md 14-api-07-checkpanic.md 14-api-08-status-codes.md

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian API doc – $DIFF seconds"

