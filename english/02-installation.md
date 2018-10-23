# Installation

## Selection of Operating System

It is recommended to run Security Center software on operating system Microsoft Windows 10.

If you intend to use Security Center software in network, it is preferable to install the server part of Security Center software (full installation) on computer with operating system Microsoft Windows Server 2016.

It is best to use NTFS as the file system.

It is strongly recommended that you update the current operating system by installing the latest service packs provided by Microsoft.

## Configuration of Computer Disk Subsystem

To ensure reliable storage of information and enhance the system performance, it is recommended to install two hard disks on the computer, on which Security Center software will befully installed. In this case, install the operating system and Security Center executable files on one hard disk and the database directory on the other. If it is impossible to install two hard disks, it is recommended to divide the single hard disk into two partitions and install the operating system on one of them, and the Security Center database on the other.

Besides, regardless of the disk subsystem configuration, you shall configure backup for Security Center software database so that the backup copy is created on an additional hard disk or network resource, which is a physically different storage device.

## Additional Requirements

Before installing Security Center software, you need to make sure that the Andromeda Liberty software or the Andromeda software prior to version 2.8 is not installed on the computer. If one of these programs is detected, delete it before installing Security Center software.

To install Security Center, you need to install Microsoft Internet Explorer 8.0 or higher. It is also recommended that the system has the following components and programs:

* For operating systems Microsoft Windows XP, Microsoft Windows Server 2003 and Microsoft Windows Server 2008:

	* Windows Installer 4.5 or later

	* Microsoft .NET Framework 3.5 SP1

* Microsoft Data Access Components (MDAC) 2.8 or higher

* Microsoft .NET Framework 2.0

Before installing Security Center, you need to make sure that all hardware requirements and operating system requirements are met.

> If it is planned to use Security Center with video routers by C.Nord company, then it is necessary to install the latest version of Adobe Flash Player on the computer where you want to run the module "Duty operator", which can be uploaded from [the Adobe official website](https://get.adobe.com/flashplayer/).

## Installer

When installing Security Center software, you need to specify values for several installation options.

Immediately after the installer starts, you need to specify the installer user interface language.

\imgcapt{img/Setup-Main-01.png}{Selecting installer language}

After that, you will need to select the language of the Security Center user interface from the following list:

* English

* Russian

* Spanish

\imgcapt{img/Setup-Main-02.png}{Selecting Security Center language}

Be careful: Security Center user interface language cannot be changed after installation. If an error is made when selecting the user interface language, to correct it, you will need to remove the Security Center and reinstall it.

Next, the installer will prompt you to specify the directory where the executable files of the Security Center will be located.

\imgcapt{img/Setup-Main-03.png}{Selecting installation folder}

After that, you will need to select the type of workstation on which you are installing:

\imgcapt{img/Setup-Main-04.png}{Selecting installation type}

* Select _Full installation_ if the computer will act as a server: it will store Security Center database, and will receive events.

> Select full installation if it is the only computer on which Security Center will be used.
> In case of full installation, Microsoft SQL Server and Security Center database will be installed on the computer. Besides, "Event manager" module will be installed on the computer to receive and process notifications.

* Select installation on _Network workstation_ if it is necessary to organize a workplace in the local computer network. Almost all program functions are available to the operator on the network workstation. An exception is a number of service operations, such as changing settings of "Event manager" module and backup management.

> When installing on a network workstation, you will need to specify the computer on which the full version was previously installed.

### Full installation

When installing the full version, you will need to specify the directory in which Security Center database will be stored.

\imgcapt{img/Setup-Full-01.png}{Full installation: selecting database installation folder}

To increase Security Center performance, it is recommended to place the database files on a separate hard disk or at least on a separate hard disk partition. By default, the installer prompts you to install the database files on a disk partition other than the system one.

\imgcapt{img/Setup-Full-02.png}{Full installation: selecting BDE setup}

You also need to specify the need of BDE setup. The BDE subsystem ("Borland Database Engine") was used by the Andromeda 1.0 - 2.76, as well as Andromeda Liberty for the database access. BDE subsystem is used by Security Center only when importing data from the databases of the listed programs. If you do not need to import information from the databases of Andromeda 2.6 - 2.76 or Andromeda Liberty, it is not necessary to install the BDE subsystem.

In case of full installation, a named instance of Microsoft SQL Server 2005 Express Edition will appear on the computer. The instance name is "ANDROMEDA". To perform full installation, the computer shall not have an instance of Microsoft SQL Server with the same name.

Before the installer begins installing SQL Server 2005 and copying the Security Center files to the computer, you can view its settings to make sure that all values for all parameters are set correctly.

\imgcapt{img/Setup-Full-03.png}{Full installation: list of setup program settings}

### Installation on network workstation

When installing Security Center on a network workstation, you shall specify an instance of Microsoft SQL Server that is used to store the database.

\imgcapt{img/Setup-Network-01.png}{Installation on network workstation: selecting SQL server}

An instance of Microsoft SQL Server is installed when a full installation of Security Center is performed. The instance name is "ANDROMEDA". Thus, you need to select a line of the form "`computer name\ANDROMEDA`" in the list, where `computer name` is the name of the computer to which the full installation of Security Center was performed.

If the installer cannot find the instance of Microsoft SQL Server in the local network that is used to store Security Center database, it is recommended to specify the computer name and instance name manually.

After this you need to enter the name or IP address of the computer on which "Event manager" module is started. In most cases, this is the same computer that is used as Security Center server.

\imgcapt{img/Setup-Network-02.png}{Installation on network workstation: selecting computer with "Event manager" module}

Communication with "Event manager" module is necessary for the remaining modules of Security Center to exchange information and synchronize actions.

Before the installer begins copying the files to the computer, you can view its settings to make sure that all values for all parameters are set correctly.

\imgcapt{img/Setup-Network-03.png}{Installation on network workstation: list of installer settings}

## Security Center Removal

To uninstall Security Center, you shall use the corresponding item in the Windows Control Panel.

## Installation Problems

If there are any problems with Security Center installation, contact the technical support service of C.Nord by e-mail support@cnord.ru.

When contacting technical support, specify Security Center version that is being installed and describe the problem.

In case of request by e-mail, it is recommended to attach the archive containing the following files:

* file `C:\Andromeda_Install.log` - This file contains the log of Security Center installer

* files from folder `C:\Andromeda Log` - The files contain the logs Security Center modules

* files from folder `C:\Program Files\Microsoft SQL Server\90\Setup Bootstrap\LOG` - The files from this folder and its subfolders contain the logs of Microsoft SQL Server Setup installer

The listed files do not contain personal data or confidential information.
