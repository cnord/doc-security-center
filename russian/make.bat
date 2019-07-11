pandoc --template template/template.latex -V title-source=title-install.tex -o sc5-installation-rus.pdf 01-introduction.md 02-1-installation.md 02-2-installation_sql.md

pandoc --template template/template-manual.latex -V lang=russian -o SC5-UserManual-Rus.pdf *.md

pandoc --template template/template.latex -V title-source=title-http-api.tex -o sc5-http-api-rus.pdf 14-api-01-intro.md 14-api-02-object.md 14-api-03-part.md 14-api-04-zone.md 14-api-05-cust.md 14-api-06-extfield.md 14-api-07-checkpanic.md 14-api-08-siteevents.md 14-api-09-schedule.md 14-api-10-myalarm.md 14-api-11-alarms.md 15-api-tf.md