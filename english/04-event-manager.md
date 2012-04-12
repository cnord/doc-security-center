## Event Manager

The “Event Manager” module is designed to receive events from receiving equipment of a central station as well as directly from certain types of field equipment, e.g. via GPRS and Ethernet communication channels.

The result of processing the received events by “Event Manager” module consists in events which form the basis of the “Security Center” operation.

In the “Event Manager” the automated event processing takes place: event chains control, sending SMS messages and transmitting events to other systems.

The “Event Manager” is the interlink for all other modules of the “Security Center”: it should be started the first as it is the one via which other modules exchange information about new events, actions of operators and other changes which have taken place during module.
After module starting, in the system field of Windows task bar the icon appears which informs about the module operation. When any event is received the icon color changes, and if you move the cursor onto the icon the information about last event time and total number of events from module starting appears.

Right-click on module icon results in the menu displaying. 

### Module settings

You can get access to settings if you select “Setting...” item in the module menu.
The “**Frequency of security schedule alarms**” parameter sets the interval of system events with ZZXB and ZZXC codes generating. System events with these codes are generated when the daily object security schedule is violated and long-term object security is violated respectively. Setting of security schedule as well as setting of long-term security of object is performed individually for each object in the “Object Manager” module.

The “**Interval of repeated events filtration**” parameter sets the interval within which the second and succeeding equal events received via different communication channels will be considered being repeated. The repeated events are processed in the “Security Center” modules in a special way. For instance in the “Duty Operator” module, they are not displayed in the general list of received events. But they can be included in the display of events from the object tab. In addition, the repeated events are not included in event reports unless such necessity is specified intentionally. Recommended value for this parameter is 60 seconds.

“**Test events filtration**” can be turned off using homonymous parameter. When filtration is turned on the test events are processed in the same manner as the repeated events: they are not displayed in the “Duty Operator” module and in the event reports. 

It is essential to understand that the repeated and test events constitute 75 to 95 percents of total number of events received by the “Security Center”. Consequently repeated and test events filtering mechanism permits to release the "Security Center” operators from necessity to process useless information. For the same reason events filtration positively influence the performance of the “Security Center” modules. It is not recommended to turn off repeated and test events filtration without strong reasons. 

#### Backup

The “Backup” tab of the “Event Manager” module settings window is intended for management of backup tasks. 

There are two different types of the “Security Center” database backup copies: operative and full. 

* Full database copy contains all information being stored in the database at the moment of copying including received events, operator actions and sent SMS messages for all time of software running.
* Data amount in the operative copy is much less: in this copy the events, operator actions and SMS messages for the last month only are stored.

In general, it is recommended to use operative copying for backup tasks. Full backup is recommended to be executed manually or using tasks of Windows scheduler.

For each backup task several destination folders can be specified: after backup copy of data has been created it will be copied in each of these folders. In this process the number of the “Security Center” database backup copy files in each destination folder will be supervised. If during backup copy creation it is determined that the number of backup copy files is greater than specified by the "Number of files in the destination folder” parameter then the oldest file of backup copy is deleted.

In addition to the backup interval, which sets the frequency of executing the backup task you can set the start time for a task executing. In such manner you can arrange a backing up once a day or start a periodic backing up each day at the same time.

More detailed information about backing up can be found in the respective section of description of Database Wizard module one of the purposes of which is creation of the “Security Center” database backup copies.

### Event sources

The main purpose of the “Event manager” module is to receive events from receiving equipment of a central station as well as directly from certain types of field equipment, e.g. via GPRS and Ethernet communication channels. Variety of methods and protocols for annotations transmission is supported using special components of the “Event Manager” module which are called sources of events.

You can get access to event sources settings by selection of the “Event sources..." item in the module menu.

The “Security Center” software, version 3.3, contains the following sources of events:

#### Event source from PimaGuard

It is designed to receive events via serial port or Ethernet from “Mcard for MS-DOS”, “Pima NetSoft” and “PimaGuard for Windows” software in the “Andromeda” protocol.

It is the most advanced source for receiving events from a central station receiving equipment from Pima company. In case when support of the latest capabilities of a central station receiving equipment, as well as protocols and events transmission channels is required this very event source should be used.

When source from PimaGuard is used in the mode of receiving events via Ethernet, we recommend to use separate instance of event source for each instance of transmitting software.

#### Event source via TCP/IP

It is designed to receive events via network supporting TCP/IP protocol form the following equipment manufactured by C-Nord company:

* GSM transmitters: TP-100GSM and TP-100GSM II – via GPRS channel
* panic button “Button” – via GPRS channel
* “Cepheus” extender – via Ethernet channel

When this event source is used usually dedicated IP address in the Internet is required. Additionally, it is recommended to connect different types of equipment to different instances of event source, and when the “Cepheus” extender is connected the best variant is to use a separate instance of event source for each extender.

#### Event source via GSM

It is designed to receive events via SMS and CSD channels of GSM from the following equipment:
* panic button “PT-300” manufactured by GemTek company – via SMS channel
* panic button the “Button” manufactured by “C-Nord” company – via CSD channel
* It is necessary to note that to use source of events via GSM you should connect to the computer SonyEricsson GT-47, Siemens MC35 GSM modem or a modem compatible with them with respect to command system.

#### Event source from Sur-Gard

It is designed to receive events through serial port from receiving equipment of Sur-Gard central stations manufactured by DSC company up to System III including. 

As data transmission format used by Sur-Gard central stations is actually a standard, this event source can be used to receive events from equipment and software from wide variety of manufacturers: “Ritm”, “Proxima”, Jablotron and others. 

#### Event source from RC4000

It is designed to receive events through serial port from RC4000 central surveillance unit manufactured by Visonic company. 

If you are using RC4000 unit together with CSM32 software and want to change over to the “Security Center” software, you should know that there is possibility to perform automatic data import from CSM32 software. More detailed information about this function can be found in the “Database Wizard’ module using which data import is performed.

#### Multiprotocol event source

It is designed to receive events through serial port from SilentKnight 9500 central surveillance unit (manufactured by Honeywell company) and RCI4000/RCI5000/DTRCI5000 units (manufactured by KP Electronics company). Additionally this event source supports data receiving in some other commonly used protocols, e.g. in Ademco 685 protocol.

### Settings of event sources

If event source is designed to receive data via serial port you should choose the port to which a central station equipment is connected and specify its parameters (speed, parity, number of data bits, etc).

If event source is designed to receive data via network supporting TCP/IP protocol then it will be necessary to specify network interface and port at which the source will wait for reception of incoming connections as source parameters.

The “Internal Number” of event source is needed for its identification both by the “Security Center” and by user. First, number of event source is used to determine from which source a particular event has been received. Secondly, in case when an event source informs a user about anything the event created by it for this purpose will have the same object number as internal number of component. 

We strongly recommend to create in the “Security Center” the objects with numbers that match to the internal numbers of event sources being used. This will permit to control origin of errors occurring during event sources operation and also to obtain service information about operation of sources.

The “Event Source control time” permits to automatically track the fact of events reception by source and inform an operator about the problems risen during reception. In case when by any reason the event source has received no events within the interval specified by this parameter the system event with “ZZXH” code and object number corresponding to the internal number of event source is created.

Using the “Shift of object numbers” positive integer summand can be set which will be added to object number for each event received by event source. 

The “Shift of object numbers” is recommended to use in case when several central surveillance units (including different units) is to be connected to one instance of the “Security Center”. By specifying different shifts of object numbers for different event sources you can avoid the problem with overlapping the same numbers of different objects working for different units.
For example, two Lonta-202 units are connected to the “Security Center”. The ranges of object numbers which can be connected to units are the same - 1 to 600. But if you set the shift of object numbers for one event source equal to 1000 and for the other - 2000, then within the “Security Center” we will work with 1001-1600 objects for one unit and with 2001-2600 objects for the other.

The “Shift of channel numbers” is the parameter that sets positive integer summand which will be automatically added to receive channel number. 

If zero value of channel number shift is set then for events received by event source the channel number will be used which is transmitted by receiving equipment of a central station or the first channel number if the equipment does not transmit channel number.
By setting different shifts of channel numbers for different event sources you can recognize event sources (and units connected to them) for received events.

The “Shift of channel number” is of special interest when several identical event sources are used because types and numbers of communication channels used by these sources will surely coincide.

The “Type of receiving channel” and the “Number of receiving channel” permits to clearly specify the parameters corresponding them by value in case when they can’t be uniquely identified. For example, The “Event source via TCP/IP” can receive events both from TP-100GSM transmitters via GPRS channel and from “Cepheus” extenders via Ethernet channel. Event source cannot identify communication channel which is used during transmission. Therefore when setting an event source it is necessary to specify clearly the type of communication channel which is used during transmission (GPRS if the source is intended to receive events from TP-100GSM or Ethernet if the source is receiving data from “Cepheus”. Additionally, if several such event sources are used then to differ which source has received the event it is necessary to specify different numbers of receiving channels for them.

The “Reinititilazation Interval” parameter permits to force reinitialization of equipment (e.g. GSM modem) connected to event source.

Using the “Exchange Registration” function the data exchange protocol between event source and receiving equipment of central station or control panel can be saved on hard disk. This information can be necessary during causation of exchange problems. We do not recommend to switch on the exchange registration independently without request from technical support service of Research-and-engineering and profit corporation C-Nord company.

### Event handlers

After the “Event Manager” has received event from the central surveillance unit or control panel it performs its decoding and description according to event template preset for the object from which the event has been received. The event received as a result event decoding can be automatically processed in the “Event Manager” module using special module components which are called event handlers.

In the set with the “Security Center”, version 3.3, software the following event handlers are delivered:

#### Event Control 

This handler performs a control of a periodic reception of an event of the specified class and generation of a system event in case of its absence.
The handler can be used to fulfill the following tasks:

* “Guard Control”. The task of guard control often consists in a simple control of periodic receiving the specified event. In this process notwithstanding that the sequence of event reception is not checked it is possible to carry out security guards control even on a complicate route via selection of event reception intervals.
* “Control of Automatic Tests”. Contrary to an object control time implying arrival of any event via any communication channel, a periodic arrival of a specific event can be controlled and also a communication channel via which this event should be received can be specified.

#### Control of Events Chain

This handler is intended to monitor time sequence (chain) of received events and generation of system messages in case of its violation.

The handler is designed to fulfill such tasks as:

* “Control of Paired Events”. For instance, the control of 220V restore or other faults at site. Using the “Events Chain Control” handler short-term faults can be distinguished from fatal ones, for instance, the objects can be identified where electric power is missing too long.
* “Guard Control”. Use of this handler permits to control a guard’s movement along a route with regard to correct  sequence of walk.

#### Entering through Alarm

The “Entering through Alarm” handler permits to suspend alarm event processing by the “Event Manager” module and wait for removal from guard which can be received immediately after an alarm.

Purpose of this event handler is to release a duty operator from necessity to respond to obviously false alarms which happen while removing objects from guard.

This handler should be applied to such objects where guarding tactics excluding entrance delay is used. Use of this handler is also justified for all objects where personnel error while taking off from guarding is possible.

#### SMS Transmitter

This handler permits to arrange transmission of information about received messages to a mobile phone as SMS messages.

To send SMS messages the handler can use GSM modem which should be connected to a computer or direct connection to SMS server of cellular operator via TCP/IP network.

Using SMS Extender handler optional service can be rendered to guarding enterprise clients, e.g. informing responsible persons about events of object putting under and taking off from guarding.

Additionally, using this handler alarms can be transmitted directly to guard’s mobile phone in parallel to a duty operator work.

Use of this handle can also significantly simplify commissioning of equipment on connected objects. If you allocate a personal object number to an engineer which number should be used during testing equipment on the object, and switch on SMS-forwarding for events received from this object to the engineer’s mobile phone then the engineer will be able to set up equipment without assistance of unit’s duty operators.

#### Pandora Net

The main task of the “Pandora net” handler is to arrange information exchange between independent instances of the “Security Center” software. Events, operator actions and object descriptions can be transmitted from one “Security Center” to another.

Any channel supporting TCP/IP protocol can be used as data communications channel. 
There is possibility to describe in details the amount of information which will be transmitted. You can specify numbers and number intervals of objects from which events will be transmitted, specify event classes to be transmitted, select operator actions to be transmitted. Mutual data transmission (cross-transmission) is possible.

Primarily the event handler is used for creating distributed monitoring systems when several central surveillance units are integrated and it is necessary to collect operative information in the certain control center.
