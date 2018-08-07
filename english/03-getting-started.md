# Getting Started

## Security Center Variants

Variants of Security Center software differ in the maximum possible number of serviced sites: 1000, 1500, 2000, etc.

There are no restrictions on the use of event sources, and the event sources from third-party centralized monitoring panels shall be purchased separately.

Starting variant of Security Center is free of charge and allows to guard up to 1000 sites.

## Purpose of Modules

Security Center software consists of modules, each of which is intended to solve specific problems.

The "**Event Manager**" module is intended for receiving notifications from the receiving equipment of the central station, as well as directly from certain types of site equipment, for example, via GPRS and Ethernet communication channels. 

Besides, it is in the "Event manager" module where events are automatically handled: event chains are monitored, SMS messages are sent and events are transmitted to other systems. 
It shall be noted that the "Event Manager" is the link for all other modules of Security Center: it shall be launched first, because it is with its help that the modules exchange information about new events, operators’ actions and other changes that occurred during the module operation.

The "**Site Manager**" module is used for creation of new sites and changing description of the existing sites.

The "**Duty Operator**" module is used by the operator to handle events. The main functions of the module are monitoring of the site operative state, viewing the latest received events, recording the operator's actions for handling of the alarm received from sites.

The "**Site Maps**" module is intended for creation of schemes of access to the site, floor plans and location of the protection coverages. Besides, the "Site Maps" module is used to display the site alarm zones on the floor plan during alarm handling.

The list of operators of Security Center, as well as their rights in each of the modules are set in the "**Personnel Manager**". In the same module, it is possible to change the list of guards, as well as the list of computers on the local network on which the network workstations of Security Center are operated.

The "**Database wizard**" module is intended for the following operations:

* database check and error recovery
* database backup
* database restoration from a backup
* import of data from "Andromeda" software database, "Andromeda Liberty" software, "Strazh" software and "CSM32" software
* export of data from Security Center database for use in other programs

In the **System Setup** module, it is possible to change the directories that are used to describe the sites: list of event templates, event classes and associated actions, site types and list of additional characteristics.

## First Start

To get started, it is necessary to start the "Event manager" module and configure the event sources - special module components, intended to receive events from the central station equipment.

The event sources are configured in the "Event sources" window. To access it, select "Event sources ..." item in the "Event manager" module (right-click on the icon in the system tray of the taskbar).

If Security Center is installed just to get acquainted, then to create events from sites it is possible to use the "Emulation of events ..." item in the "Event Manager" menu.

After the "Event manager" module is started, it is possible to start working with other modules. Sites are entered into the system with the help of the "Site manager" module, and the received events are monitored and alarms are handled with the help of the "Duty operator" module.

## Admin Password

Immediately after installation of the Security Center software, only one operator is present in the list of operators: "Administrator". The password of the "Administrator" operator by default is **222222**.

## Data Import

The Security Center software implements the function of importing information about sites from databases of the following programs:

* «Andromeda» versions 2.0 — 2.76
* «Tsentavr»
* «PCN6»
* «GuardNet»
* «Strazh»
* «CSM32»
* «Neman»
* «Mirazh»
* «Import from XML»

If before Security Center installation the software from the list above was used, then for a comfortable transition to Security Center, it is possible to import the descriptions of sites from the database of these programs.

If it is intended to import data from the "Andromeda" software version 2.0 - 2.76 or "Andromeda Liberty", then when installing Security Center, it is necessary to specify the need to install BDE, the subsystem used to access the data of these programs.

Data import is performed with the help of the "Database wizard" module. In the case of import from "Andromeda" software versions 2.0 - 2.76 or "Andromeda Liberty", all files from the database folder will be required to run it. If there is a backup copy of the database in ZIP format, it is necessary to extract the files from the archive to any folder on the computer hard drive.
