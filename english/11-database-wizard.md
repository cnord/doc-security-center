## Database Wizard

### Purpose

The “Database Wizard” is designed to fulfill the following operations:

* database verification
* work with backup copies
* data import and export

### Database verification

Database verification procedure is recommended to be executed not more rarely than monthly. During database verification the rest modules can continue their operation. Upon completion of verification it is recommended to restart the “Duty Operator” module

### Database backup

Database backup can only be executed on the computer where full installation of the “Security Center” was performed.

Backup procedure does not have critical impact on the operation of other “Security Center” modules However during backup execution certain lowering of entire system performance is possible: this should be taken into account when selecting time for the backup operations.

When you create a database backup copy you should select the volume of information to be copied. 

* Full database copy contains all information being stored in the database at the moment of copying including received events, operator actions and sent SMS messages for all time of software running.
* Data amount in the operating copy is much less: in this copy the events, operator actions and SMS messages for the last month only are stored.

On the basis of volume of saved during backup information it is recommended to execute full backup not more rarely than monthly, and an operative backup – not more rarely than daily.

To store backup copies it is recommended to use one but better- several data mediums which are not physically connected with the disk subsystem of the computer where the “Security Center” database is stored. For example, it can be a separate hard drive, flesh drive or network resource. It should be noted that when adjusting backup you can specify several paths for backup copy saving.

In order to improve the entire system reliability the “Security Center” performs automatic backup. Operating copies of database are saved in the “ANDROMEDA DATA\SYSBACKUP” folder, interval of automatic backup copies creation is 24 hours.

### Restore from backup

Database restore from the backup copy can be done only in the computer where the full installation of the “Security Center” software was executed. 

Prior to proceeding to database restore from the backup copy it is necessary to stop the operation of all “Security Center” modules including the “Event Manager” module.

Database version from which restore is executed does not have any significance: immediately after restore the “Database Wizard” will verify version of restored data and execute updating if necessary.

In order to prevent the generation of events about the absence of the control event immediately after the database restore from the backup copy you should specify when proceeding to restore the necessity to set current time for objects as time of the last event receiving.

Database restore is recommended to be executed in two steps: first to execute restore from the most resent full database copy and then – from the actual operating copy. Thus, in the first step entire existing history will be restored, and in the second step permanently changing information will be updated.

Upon completion both steps of the database restore from the backup copy it is recommended to verify the database. In this case you have to remember that database verification procedure does not disable other modules of the “Security Center”, therefore, this procedure can be executed after starting the “Event Manager” and “Duty Operator”.

### Data Import

The “Security Center” software supports data import from the following sources:

* database of the “Andromeda” software, versions 2.0 - 2.76
* database of the “Andromeda Liberty” software
* database of the “Guardian” software
* database of the “CSM32” software

Data import can be done only in the computer where the full installation of the “Security Center” software was executed. 

Prior to proceeding to data import it is necessary to stop the operation of all “Security Center” modules including the “Event Manager” module.

#### Import from “Andromeda”, versions 2.0 - 2.76 and “Andromeda Liberty”

If it is intended to import data from the “Andromeda”, versions 2.0 - 2.76, or the “Andromeda Liberty” software then during installation of the “Security Center” you should specify the necessity to install BDE as this very subsystem is used to access to these programs data.

When executing data import from database of the “Andromeda” not only the description of objects and associated information can be transferred but also received events and operator actions.

If the database from which import is executed contains events for several years then import of events and operator actions can take rather long time. In this case it will be better to divide the procedure of import into two steps: first, import system information and events for the last month then start the “Event Manager” module and after having started to work with the “Security Center” import the rest events and operator actions. 

Events and actions are always imported for entire month notwithstanding that in import settings you can set data for the exact day.

When importing from the “Andromeda”, versions 2.0 - 2.76 function of objects numbers shift is available. The substance of function consists in that to numbers of objects information about which is transferred to the “Security Center” a summand specified during the import procedure setting will be added. 

When the shift is used and the import procedure is divided into two steps then shift settings must be specified both in the first and in the second step though in the second step only events and operator actions are transferred.

The shift of object numbers can be useful if several databases are integrated in one, for example, when several units are integrated.

In order to prevent the generation of events about the absence of the control event immediately after the data import you should specify when adjusting import the necessity to set current time for objects as time of the last event receiving.

#### Import from “Strazh” software

If you intend to import object descriptions from “Strazh” software, then a computer must have Microsoft Access 2003 or later installed in it for a period of import execution. 

You may install the “Security Center” into computer with the “Strazh” software, execute import and transfer the “Security Center” data using the backup copy.

When importing from the “Strazh” software it is necessary to specify the folder in which the database files if this software are located. If to the “Strazh” software was connected the “Lonta-202” (“RS-202”) station, then import execution two file are required - the“Guard.mdb” and “SurGuard_code.mdb”. If only the “RS-200” station was used, then to execute import the “Guard.mdb” file is enough.

In the settings of import operation from the “Strazh” software you can specify numbers or intervals of numbers of objects descriptions of which must be transferred to the “Security Center”. Thus, you can import descriptions of not all objects but only part of objects – only of required ones.

When executing import from the database of the “Strazh” software numbers of imported objects may be shifted. The substance of shift consists in that to numbers of objects information about which is transferred to the “Security Center” a summand specified during the import procedure setting will be added. 

The same function is available in the setting event receive from the “RS-200” and “Lonta-202” units. Thus, by shifting object numbers you can arrange the “Security Center” software operation with several units from the same or different manufacturers.

When importing from the “Strazh” all features of description of objects used in this software are supported, including possibility to declare several objects as sections of one transmitter. 

#### Import from “CSM32”

If you intend to import the object descriptions from the “CSM32” software, then a computer must have Microsoft Access 2003 or later installed in it for a period of import execution. 

You may install the “Security Center” into the computer with the “CSM32” software, execute import and transfer the “Security Center” data using the backup copy.

When importing from the “CSM32” software path to the “Main.mdb” file must be specified where the “CSM32” software data are stored.

To transfer as full as possible the description of objects it is necessary when setting import from the “CSM32” to specify mapping of event classes used in the “CSM32” to event class types of the “Security Center”.

### Data Export

The “Security Center” software supports the export of information about the objects to the text file with value separators.

When executing export it is necessary to select objects and fields (columns) the information about which will be written to the export file.

Also it is necessary to specify a name of file to which export will be executed as well as a symbol which will be used as the separator.

### Command Line Parameters

Along with the graphic user interface the “Database Wizard” module has possibility of control using command line parameters. 

This possibility can be useful in case when Windows scheduler with more developed capabilities than built in the “Event Manager” module scheduler is used as a task scheduler for the database backup copy creation or restore from the backup copy.

#### Database backup

	AnDBWiz.exe 
		/BACKUPDB 
		/FOLDER:”Destination folder 1”;”Destination folder 2”
		/TYPE:Type of backup copy
		/BACKUPCOUNT:Number of files in destination folder

	/BACKUPDB

This parameter shows that the “Database Wizard” module must execute database backing-up. Settings of backing-up procedure are defined by succeeding it the parameters of the command line.

	/FOLDER:”Destination folder 1”;<”Destination folder 2”>

One or more folders to which the database backup copy will be placed. At least one folder must be specified. Names of folders must be is enclosed in the quotations. If more than one folder is specified they must be separated by “semicolon” character. Use of absolute paths in the folder names is allowable.

	/TYPE:Type of backup copy

The type of the backup copy to be created.
“0” value for this parameter corresponds to the need to create the operating backup copy. 
“1” value means that the full backup copy of the database must be created.
The parameter is not mandatory. If the parameter value is not set then the operating backup copy will be created.

	/BACKUPCOUNT:Number of files in destination folder

This parameter defines maximum allowable number of database backup copy files in the destination folder. If during the backup copy creation it is determined that the number of backup copy files of the same type exceeds the maximum allowable number then the oldest file of the backup copy is deleted .

The parameter is not mandatory. If the parameter value is not set then 10 value is used for this parameter.

#### Database restore from backup copy

	AnDBWiz.exe 
		/RESTOREDB 
		/FOLDER:”Source folder” 
		/TYPE:Type of backup copy

	/RESTOREDB

This parameter shows that the “Database Wizard” module must execute the database restore from the back-up copy. Settings of the database restore procedure are defined by succeeding them the parameters of the command line.

	/FOLDER:”Source folder”

The folder which will be searched for the database backup copy and from which the restore will be done. If several backup copy files of the preset type is found in the specified folder then the restore is executed from the most newly created file.

	/TYPE:Type of backup copy

The type of the backup copy from which the restore must be done. “0” value for this parameter corresponds to the need to recover from the operating backup copy. “1” value means that database must be recovered from the full backup copy. The parameter is not mandatory. If the parameter value is not set then restore will be executed from the operating backup copy.

#### Example of Command Line Parameters Use

	AnDBWiz.exe 
		/BACKUPDB 
		/FOLDER:”E:\Backup Data\Operational”;”\\Storage\Andromeda Backup\Operational” 		
		/BACKUPCOUNT:25

Above mentioned set of the command line parameters means that the “Database Wizard” module must create the operating database copy and copy it to the folders ”E:\Backup Data\Operational” and ”\\Storage\Andromeda Backup\Operational”. 

When copying the backup copy to the destination folder the “Database Wizard” module must verify that total number of the operating backup copy files in the destination folder does not exceed 24, and if there are more files then the oldest by time of the creation backup copy file must be deleted.

