#!/bin/sh

START=$(date +%s)
 
pandoc --template template/template.latex -V title-source=title-install.tex -o sc5-installation-rus.pdf 01-introduction.md 02-1-installation.md 02-2-installation_sql.md
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian instalation manual – $DIFF seconds"

START=$(date +%s)

pandoc --template template/template.latex -V title-source=title-manual.tex -o sc5-usermanual-rus.pdf 00-whats-new.md 01-introduction.md 02-1-installation.md 02-2-installation_sql.md 03-getting-started.md 04-event-manager.md 05-object-manager.md 06-system-setup.md 07-personnel-manager.md 08-maps-of-objects.md 09-duty-operator.md 10-report-manager.md 11-database-wizard.md 12-cloud-services.md 13-outro.md

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian user manual – $DIFF seconds"

START=$(date +%s)

pandoc --template template/template.latex -V title-source=title-http-api.tex -o sc5-http-api-rus_v5.10.pdf 14-api-01-intro.md 14-api-02-object.md 14-api-03-part.md 14-api-04-zone.md 14-api-05-cust.md 14-api-06-extfield.md 14-api-07-checkpanic.md 14-api-08-siteevents.md 14-api-09-events.md 14-api-10-schedule.md 14-api-11-myalarm.md 14-api-12-alarms.md 15-api-tf.md

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian API doc – $DIFF seconds"

START=$(date +%s)

pandoc --template template/template.latex -V title-source=title-http-api.tex -o sc5-http-api-rus_v5.10-neva.pdf 14-api-01-intro.md 14-api-02-object.md 14-api-03-part.md 14-api-04-zone.md 14-api-05-cust.md 14-api-06-extfield.md 14-api-07-checkpanic.md 14-api-08-siteevents.md 14-api-09-events.md 14-api-10-schedule.md 14-api-11-myalarm.md 14-api-12-alarms.md 14-api-13-neva.md 15-api-tf.md

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Russian API doc + Neva – $DIFF seconds"
