## Installation

### Operational system selection

It is recommended to run the “Security Center” software under Microsoft Windows 7 operational system.

If the “Security Center” software is supposed to be used in a network, then the server part of the “Security Center” software installation (complete installation) is preferably to be executed on the computer running Microsoft Windows Server 2008 operational system.

Using NTFS as a file system would be the best choice.

It is strongly recommended to update running an operational system by installation of the last service packs offered by Microsoft.

### Configuration of computer’s hard drive subsystem

To provide reliability of information storage and to increase system performance it is recommended to mount two hard disks in a computer in which full installation of the “Security Center” software will be executed. In this process, an operational system and executable files of the “Security Center” should be installed on one hard disk and database directory – on the other. If there is no possibility to mount two hard disks it is recommended to split a single hard disk into two sections and accommodate an operational system in one of them, and the “Security Center” database directory – in the other.

Additionally, irrespective of a disk subsystem configuration, it is necessary to set up the procedure of the “Security Center” software database backup so that backup copy would be created on an additional hard drive or network resource – physically other information storage device.

### Additional requirements

Before "Security Center" installation, please, make sure that "Andromeda Liberty" software or "Andromeda" software with version that is lower than 2.8 are not installed on your computer. If you find one of the above mentioned software, it is necessary to delete it before "Security Center" installation.

To install the “Security Center” it is necessary to have “Microsoft Internet Explorer”, version 8.0 or higher, software running in a computer. Also, it is recommended the following components and programs being available in the system:

* Windows Installer, version 3.1 or higher.
* Microsoft Data Access Components (MDAC), version 2.8 or higher.
* Microsoft .NET Framework, version 2.0

Prior to starting the installation of the “Security Center” you should make sure that all hardware requirements and operational system requirements are fulfilled.

### Installation program

During the installation of the “Security Center” you should specify values for several installation parameters.

Immediately after the installation program start-up it is necessary to specify the installation program user interface language.

Then you will need to choose a language of the “Security Center” software user interface from the following list: 

* English
* Hebrew
* Spanish
* Russian
* Turkish

Be attentive: it is impossible to change the selected value after the installation. If a mistake is made during the user interface language selection then in order to correct it you will need to remove the “Security Center” software and install it once again.

Then the installation program will offer you to specify directory which will contain executable files of the "Security Center”.

After this you need to choose the type of workstation to which the installation is executed:

* __Full installation__ should be chosen in case when a computer will execute the role of server: it will store the “Security Center” software database and also it will receive events. 
In addition, the full installation should be chosen in case when this is the only computer which will run the “Security Center” software.

	Microsoft SQL Server and the “Security Center” database will be installed on a computer during the full installation. Additionally, the “Event Manager” module will be installed on a computer. This module receives and processes events.

* __Installation on network workstation__ should be chosen in case when it is necessary to arrange a workstation in local computer network. At the network workstation, virtually all program functions are available for an operator. The exception is constituted by the number of service operations such as modification of the “Event Manager” settings and backup procedures management.

	When the installation on network workstation is executed it will be necessary to specify a computer on which the full installation has been preliminary executed.

#### Full installation

During the full installation, it will be necessary to specify directory where the "Security Center” software database will be stored. 

To increase performance of the "Security Center” software it is recommended to place database files on a separate hard disk or at least in a separate section of the hard disk. By default the installation program prompts to install database files in a disk section other than a system section. 

Also it will be needed to specify the necessity of BDE installation. BDE subsystem (“Borland Database Engine”) was used by the "Andromeda” software, versions 1.0 - 2.76, as well as the “Andromeda Liberty” software to organize access to database. "Security Center” software uses BDE subsystem when importing data from databases of mentioned programs only. If it is not necessary to import information from databases of the "Andromeda” software, versions 2.6 - 2.76 or the “Andromeda Liberty” then BDE subsystem installation is not required.

When the full installation has been performed the named instance of Microsoft SQL Server 2005 Express Edition software appears on a computer. The instance name is “ANDROMEDA”. To perform the full installation it is necessary that a computer does not contain the instance of Microsoft SQL Server with such name. 

#### Installation on network workstation

When the “Security Center” software is installed on a network workstation it is necessary to specify the instance of Microsoft SQL Server software which is used to store database. 
The instance of Microsoft SQL Server software is installed during the full installation of the “Security Center”. The name of instance being installed is ANDROMEDA. Thus, it is necessary to select from the list the string such as `<computer name>/ANDROMEDA`, where `<computer name>` is the name of a computer, on which the full installation of the “Security Center” software has been performed.

If the installation program could not find in local network the instance of Microsoft SQL Server software, which is used to store database of the “Security Center” we recommend to specify a computer name and an instance name manually.

Hereafter the installation program will require to enter the name or IP address of a computer on which the “Event Manager” module is started. In most cases this is the same computer which is used as the “Security Center” software server.

Connection with the “Event Manager” module is required for the rest of the “Security Center” software modules in order to exchange information and synchronize actions.
Problems during installation

If any problems have arisen during the installation of the “Security Center” software you should contact technical support service of “C.Nord" by telephone +7 (812) 327-16-36, by fax +7 (812) 327-16-33 or e-mail support@cnord.ru.

When you refer to technical support service you should specify the “Security Center” software version being installed and describe an arisen problem.

If you refer by e-mail we recommend to attach to your letter the archive containing files:

* `C:\Andromeda_Install.log`. This file contains the “Security Center” installation program activity.

* Log. files from `C:\Andromeda` Log folder. Files in this folder contain activity log of the “Security Center” modules.

* Files from `C:\Program Files\Microsoft SQL Server\90\SetupBootstrap\LOG folder`. Files in this folder  and its subfolders contain activity logs of Microsoft SQL Server program installation.

The listed files do not contain personal data or any confidential information.

