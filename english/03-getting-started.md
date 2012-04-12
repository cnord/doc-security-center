## Getting Started

### “Security Center” editions

“Andromeda Security Center” is supplied in various editions.

#### A100 and A600

These “Security Center” editions are designed to be operated with central surveillance units manufactured by Altonika Company.

“A100” and “A600” editions allow to use only those event sources, which are  designed to receive events from these units.

When you order “Security Center”, editions “A100” and “A600”, it is necessary to specify number of event sources from “Lonta-202” or “RS-200”. The number should correspond  to number of units, which are supposed to be connected to “Security Center”.

Among themselves the editions differ the maximum possible number of serviced objects: no more than 100  objects for edition “A100” and no more than 600 objects for edition “A600”.

If while operating “Security Center”, edition  “A100” or “A600” either the other central surveillance unit is required to connect  or the number of serviced objects will exceed 600 pieces it is necessary to update the edition of “Security Center” to one of the standard.

#### Standard editions

Standard editions of the “Security Center” software differ the maximum possible number of serviced objects: 250, 500, 750, 1000, 1500, 2000 and so on.
There is no restrictions on usage of event sources, but event sources from central surveillance unit of other firms are purchased separately.

### Purpose of modules

The “Andromeda Security Center” software consists of modules each one of which is designed to fulfill specific tasks.

The “Event manager” module serves to receive events from receiving equipment of a central station as well as directly from certain types of field equipment, e.g. via GPRS and Ethernet communication channels. 

In addition, it is just the “**Event Manager**” module where automated event processing takes place: event chains control, sending SMS messages and transmitting events to other systems. 
It is necessary to note that the “Event Manager” is the interlink for all other modules of the “Security Center”: it should be started the first as it is the one via which other modules exchange information about new events, actions of operators and other changes which have taken place during module.

Using the “**Object Manager**” module new objects are created and descriptions of existing objects are changed.

The “**Duty Operator**” module is used by operator to process events. The main module functions are monitoring of operational status of objects, viewing the last received events, recording operator actions in response to alarms received from objects.

The “**Maps of Objects**” module is designed to create object approach schemes, floor plans and arrangement of security lines. Also, the “Maps of Objects” module is used to display object alarm loops on the floor plan when responding to alarm.

The list of “Security Center” operators as well as their rights in each of modules is established in the “**Personnel Manager**” module. In the same module, you can modify the list of response guards as well as the list of local network computers which run network workstations of the “Security Center”.

The “**Database Wizard**” is designed to fulfill the following operations:

* database verification and error correction
* database backing-up
* restore database from backup copy
* data import from the “Andromeda” software database, the “Andromeda Liberty” software, the “Guardian” software and the “CSM32” software.
* data export from the “Security Center” database for using in other programs

In the module “**System setting**” you can modify reference guides which are used for the description of objects: list of event templates, event classes and actions connected with them, object types and list of additional properties.

The graphic object plan including the distribution of sensors as well as schemes of approaches to an object can be created or modified using “**Maps of Objects**” module. 

### First startup

To proceed to work you should start the “Event Manager” module and set up event sources – the special module components which serve to receive events from equipment of a central station.
Event sources setting is performed in the “Event Sources” window. To get access to this module you should select item “Event Sources...” from the “Event Manager” module menu (right-click the icon in the system field of the taskbar).

If the “Security Center” is installed for familiarization purposes then to create events from objects you can use “Emulate events...” from menu of the “Event Manager”.

After the “Event Manager” has been started you can proceed to work with other modules. You should enter objects into the system using the “Object Manager” and monitor events being received and respond to alarms using the “Duty Operator”.

### Data import

The “Andromeda Security Center” contains the function to perform import of information about objects from databases of the following programs:

* Andromeda, versions 2.0 - 2.76
* Andromeda Liberty
* Guardian
* CSM32

If prior to the “Security Center” any software from above mentioned list was used, then for comfortable changeover to using the “Security Center” you can import object descriptions from a database of these programs.

If it is intended to import data from the “Andromeda”, versions 2.0 - 2.76, or the “Andromeda Liberty” software then during installation of the “Security Center” you should 	specify the necessity to install BDE as this very subsystem is used to access to these programs data.

Data import is performed using Database Wizard module. In case of importing data of the “Andromeda”, versions 2.0 - 2.76, or the “Andromeda Liberty” software all files from database folder will be required. When there is backup copy in ZIP format you need to extract files from the archive in any folder on a computer hard drive.

