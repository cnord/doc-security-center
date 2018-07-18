# Database Wizard

The "Database wizard" module is intended to perform the following operations:

* database check
* operation with database backups
* data import and export

After starting the "Database wizard" module, select the required operation:

![Start window of the "Database wizard" module][id-11-01]

## Database Check

It is recommended to perform database check operation at least once a month. Procedures included in the database check do not have any settings and are performed automatically. 

During a database check, it is not necessary to stop operation of other modules. After the check is completed, it is recommended to restart the "Duty operator" module.

## Backup

Database backup can be performed only on the computer on which the full installation of the Security Center was performed.

The backup procedure does not have a critical impact on the operation of other Security Center modules. However, when performing a database backup, there may be some performance degradation of the computer as a whole. This fact shall be taken into account when choosing the time to perform a backup.

When creating a database backup, set the values for the parameters that control the backup operation.

![Backup settings window][id-11-02]

The Destination folder option specifies the folder on the hard disk of the computer or network resource in which the database backup will be saved.

The backup file name can be specified using the parameter of the same name. Despite the fact that there are no restrictions on naming the backup file, it is necessary to remember that to restore the Security Center database from the backup using the GUI of the "Database wizard" module, the file name shall begin with the Latin characters "AB”.

Note that the backup copy of the Security Center software database is created in the form of a ZIP archive, in which several files containing backup data can be included. If the archive file size exceeds 4Gb, a multi-volume archive will be created, all files of which will be needed for restoration the database from the backup.

In addition to the name of the backup file and the folder name for its location, specify the backup type that you want to create. The backup type determines the amount of information that will be included in the backup. 

In case of _full backup_, all information stored in the database at the time of copying, including received events, operator actions, and sent SMS messages over the entire period of the Security Center operation will be included in the database backup.

In case of _fast backup_, the amount of data in the backup will be significantly less: it will save events, operator actions and SMS messages only for the last month.

Based on the amount of information stored during backup, it is recommended to perform a full backup at least once a month, and fast backups - at least once a day.

To store backups, it is recommended to use not one but several media, and those that are not physically connected with the disk subsystem of the computer on which the Security Center database is stored. For example, it can be a separate hard drive, flash drive, or a network resource. 

To increase the system reliability as a whole, the Security Center performs automatic backup. Fast copies of the database are stored in the "ANDROMEDA DATA\\SYSBACKUP" folder, the interval for creating automatic backups is 24 hours by default.

## Restoring from Backup

Restoring the database from a backup can only be performed on the computer on which the complete installation of the Security Center software was performed. 

Before restoring the database from a backup, stop all modules of the Security Center, including the “Event manager” module.

The version of the database from which the restore is performed does not matter: immediately after the restore, the "Database wizard" module will check the version of the recovered data and, if necessary, perform the update.

![Configuration window for restore from a backup][id-11-03]

The name of the backup file from which it is necessary to restore the database can be specified using the same parameter. If a database backup was created in a multi-volume archive, then all archive files are required when recovering from such a copy.

The "Set current time as point of receiving last event for all sites" parameter is intended to prevent generation of events about the absence of a control event immediately after the database is restored from the backup. If this flag is set when restoring a database from a backup, then for all sites in the database of the Security Center software the reference time starts counting from the moment the database is restored from the backup.

See more information about the "Site control time" parameter in the chapter describing the "Site manager" module, section "Control time".  

It is recommended to restore the database in two steps: first, restore from the most recent full copy of the database, and then from the current fast copy. Thus, at the first stage, the entire existing history will be restored, and at the second stage, constantly changing information will be updated.

When database restoration from a backup is complete, it is recommended to perform a database check. It shall be remembered that the database check does not block the operation of other Security Center modules, so it can be performed after the "Event manager" and "Duty operator" are started.

## Data Import

It is possible to import data only on the computer on which the full installation of the Security Center software was performed. 

Before starting data import, stop all modules of the Security Center, including the "Event manager" module.

![Window for selecting data source for import operation][id-11-04]

In the Security Center, in addition to other sources, it is possible to import from an XML file.

### Import from XML File

By importing from an XML file, it is possible to import a site database of Cobra software to the Security Center.

![Window for setting import from XML file][id-11-13]

Use the "XML filename" parameter to select the database file by specifying the path to it.

When importing from an XML file, it is possible to move the numbers of the imported sites. The shift is performed because summand, specified during import setup, is added to the site numbers, information about which is transferred to the Security Center. For example, if the value of the “Shifting site numbers" parameter is set to 10000, and the site numbers in the XML file are within the range from 1 to 2000, then in the Security Center database, these sites will have numbers within the range from 10001 to 12000.

See more information about the function of shifting site numbers in event sources in the chapter on the "Event manager" module in the section "Event sources".

## Data Export

The Security Center supports exporting information about sites to a text file with a value separator.

![Window for selecting sites and fields when setting up site information export][id-11-09]

For export, select sites and fields (columns) which information will be written to the export file.
Select the sites, information about which shall be exported, by checking the boxes in the first column of the line near the site.
Select fields, information from which will be written to the export file, by enabling or disabling their display. The export file will include information only from those fields (columns) that are displayed in the table.

![Window for setting exporting information about sites][id-11-10]

Use the "File name" parameter to specify the folder and name of the export file.

Use the “Separator symbol" parameter to select the character that will be used as a field separator in one line of the export file. It shall be remembered that the line field values in the export file are enclosed in double quotes, which excludes the possibility of incorrect recognition of the separator when opening the export file.

## Command Line Options

Along with the graphical user interface, the "Database wizard" module can be used for control with the command line. 

This feature can be useful if the Windows Scheduler, which has more advanced capabilities than the scheduler built into the “Event manager” module, is used as the task scheduler for backing up a database or restoring from a backup.

### Database Backup

	AnDBWiz.exe 
		/BACKUPDB 
		/FOLDER: <Destination folder 1>; <Destination folder 2> 
		/TYPE:<Backup type> 
		/ BACKUPCOUNT: <Number of files in the destination folder>

	/BACKUPDB
	
This parameter specifies that the “Database wizard” module shall perform a database backup. The backup procedure settings are set by the command line parameters following it.

	/FOLDER: <Destination folder 1>; <Destination folder 2>
	
One or several folders to which the database backup will be saved. At least one folder shall be specified. The names of the folders shall be enclosed in quotation marks. If section folders are specified, they shall be separated by a semicolon. It is allowed to use absolute paths in folder names.

	/TYPE:<Backup Type>

The type of backup to be created. If this parameter is set to “0”, it indicates fast backup. If this parameter is set to “1”, it indicates full backup. The parameter is optional. If the parameter value is not set, fast backup will be created.

	/ BACKUPCOUNT: <Number of files in the destination folder>

This parameter specifies the maximum number of database backup files in the destination folder. If you find that the number of backup files of the same type exceeds the maximum possible number when creating a backup, the oldest backup file will be deleted. The parameter is optional. If the parameter value is not specified, the value for this parameter will be 10.

### Restoring Database from Backup

	AnDBWiz.exe 
		/RESTOREDB 
		/ FOLDER: <Source folder> 
		/TYPE:<Backup type>

	/RESTOREDB

This parameter specifies that the “Database wizard” module shall restore the database from a backup. The database restoration settings are set by the command line parameters following it.

	/ FOLDER: <Source folder>

The folder to which the backup of the database will be restored. If several backup files of the specified type are found in the specified folder, then the restoration from the most recent file creation will be performed.

	/TYPE: <Backup Type>

The type of backup from which the database shall be restored. If this parameter is set to “0”, it indicates fast backup restoration. If this parameter is set to “1”, it indicates full backup restoration. The parameter is optional. If the value of the parameter is not set, then the restoration from the fast backup will be performed.

### Example of Using Command Line Parameters

	AnDBWiz.exe 
		/BACKUPDB 
		/FOLDER:"E:\Backup Data\Operational";"\\Storage\Andromeda Backup\Operational" 
		/BACKUPCOUNT:25

The above mentioned set of command-line parameters means that the "Database wizard" module shall create a fast copy of the database and copy it to the folders `E:\Backup Data\Operational` and `\\Storage\Andromeda Backup\Operational`. 

When copying a backup to the destination folder, the “Database wizard” module shall check that the total number of online backup files in the destination folder does not exceed 24, and if there are more, the oldest backup file shall be deleted.

[id-11-01]: img/AnDBWiz-BR.png "Start window of the "Database wizard" module"
[id-11-02]: img/AnDBWiz-BR-Back-02.png "Backup settings window"
[id-11-03]: img/AnDBWiz-BR-Rest-02.png "Configuration window for restore from a backup"
[id-11-04]: img/AnDBWiz-EI-Imp-And-01.png "Window for selecting data source for import operation"
[id-11-05]: img/AnDBWiz-EI-Imp-And-02.png "Window for setting up import from Andromeda database"
[id-11-06]: img/AnDBWiz-EI-Imp-Str-02.png "Window for setting up import from “Strazh” database"
[id-11-07]: img/AnDBWiz-EI-Imp-Csm-02.png "Window for setting up import from CSM32 database"
[id-11-08]: img/AnDBWiz-EI-Imp-Csm-03.png “Window for mapping event classes during import from CSM32 database"
[id-11-09]: img/AnDBWiz-EI-Exp-Csv-02.png "Window for selecting sites and fields when setting up site information export"
[id-11-10]: img/AnDBWiz-EI-Exp-Csv-03.png "Window for setting exporting information about sites"
[id-11-11]: img/AnDBWiz-EI-Imp-GN-02.png "Window for setting up import from GuardNet database"
[id-11-12]: img/AnDBWiz-EI-Imp-Nmn-02.png "Window for setting up import from Neman database”
[id-11-13]: img/AnDBWiz-EI-Imp-XML-02.png "Window for setting import from XML file"
