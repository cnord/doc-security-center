# Event Manager

The "Event manager" module is intended for receiving notifications from the receiving equipment of the central station, as well as directly from certain types of site equipment, for example, via GSM (CSD/GPRS) and Ethernet communication channels.

Events, that constitute the basis of the Security Center software, are a result of handling of notifications received by the "Event manager" module.

The events are automatically handled in the "Event manager" module: event chains are monitored, SMS messages are sent and events are transmitted to other systems.
Besides, the "Event Manager" is the link for all other modules of Security Center: it shall be launched first, because it is with its help that the modules exchange information about new events, operators’ actions and other changes that occurred during the module operation.

After the module is started, an icon appears in the system tray of the Windows taskbar, informing you of the module's operation. After reception of events, the icon color changes, and when you hover over it, information appears on the time of the last event and the total number of events since the module was started.

If you right-click on the mouse button on the module icon, a drop-down menu will appear.

\imgcapt{img/EvMan-01.png}{Drop-down menu of the "Event manager" module}

## Module Settings

To access the settings select the "Settings ..." item in the module drop-down menu.

To access the "Settings" window and save the changes made in it, the user shall have permission to "Change settings" for the "Event manager" module.

### Common

\imgcapt{img/EvMan-02.png}{"Settings" window, "Common" tab}

The parameter "Arm schedule alarm periodicity" specifies the interval for generating system events with codes ZZXB and ZZXC. The system events with these codes are created when the daily arm schedule of the site is violated and the long-term arm schedule of the site is violated, respectively. Arm schedule and long-term arm schedule of the site are set individually for each site in the "Site Manager" module.

The parameter "Duplicate events filtration interval" specifies the interval during which the second and subsequent identical events received via different communication channels will be considered duplicate. Duplicate events are handled in Security Center modules in a special way. Thus, in the "Duty operator" module they are not displayed in the general list of accepted events. In this case, it is possible to enable their display on the events tab from the site. Besides, duplicate events are not included in the reports unless specifically indicated. The recommended value for this parameter is 60 seconds.

### Backup

\imgcapt{img/EvMan-03-01.png}{"Settings" window, "Backup" tab}

The "Backup" tab of the "Event Manager" settings window is intended for managing backup jobs.

Use the "Add ..." button to create a new backup job, and the "Change ..." and "Delete" buttons to change the settings of the existing job or to delete it.

When creating a new backup job or changing an existing backup job, it is possible to define the job parameters in the "Backup job" window.

\imgcapt{img/EvMan-03-02.png}{"Backup job" window}

The "Job name" parameter allows to specify a name for the backup job to distinguish one job from another in the list.

Use "Destination Folder" parameter to define one or more folders to which the database backup will be copied after it is created. In this case, number of files of the backup copy of the Security Center database in each destination folder will be monitored. If the number of backup files is greater than the number of files in the destination folder, set by "Destination folder files count" when creating a backup, the oldest backup file will be deleted.

There are two types of backup copies of the Security Center database: fast and full.

* _Full_ copy of the database contains all information stored in the database at the time of copying, including received events, operator actions and sent SMS messages for the entire period of the software operation.

* The amount of data in the _fast_ copy is much smaller: it stores events, operator actions and SMS messages only for the last month.

In general, it is recommended to use fast copies for backup jobs. As for full database backups, they are recommended to be done manually or using Windows Scheduler tasks. See more information about creating a database backup using the Windows Scheduler in the "Database Wizard" section.

The "Job repeat interval" parameter specifies the interval for repeating the backup job. 

By checking the box next to the "Job start time" option and specifying the time, it is possible to configure the start of the backup job at the same time. In this case, if the value of the "Job repeat interval" parameter is zero, then the job will be executed once a day. And if the "Job repeat interval" parameter is set to a non-zero value, periodic backups will be run every day at the same time.

Backup copies of the Security Center software database are created using the "Database wizard" module, including those created by backup jobs. To learn more about how to back up the database and perform database restoration from a backup see the "Database Wizard" section of this guide.

## Event Sources

The main purpose of the "Event manager" module is that it receives notifications from the receiving equipment of the central station, as well as directly from certain types of site equipment, for example, via GPRS and Ethernet communication channels A variety of methods and protocols for transmission of notifications is supported with the help of special components of the "Event manager" module, which are called "event sources".

To access the settings of event sources select the "Event sources ..." item in the module menu that appears after right-clicking on the module icon in the system tray of the taskbar.

To access the "Event sources" window and save the changes made in it, the user shall have permission to "Change settings" for the "Event manager" module.

\imgcapt{img/EventSource-01.png}{"Event Sources" window}

Click on the "Add..." button to select the desired event source from the list of the ones installed in the system.

\imgcapt{img/EventSource-02.png}{"Add Event Source" window}

Use the "Properties ..." button to change the settings of the selected event source.

### Common Event Source Settings

\imgcapt{img/EventSource-03-01.png}{"Event source Properties" window, "Common" tab}

Use the "Event source description" parameter to specify the name and important parameters of the event source, in order to see them in the list of used event sources.

The "Event source internal number" parameter is required for its identification by the Security Center and user. First, the number of the event source is used to determine from which source an event is received. Second, when the event source reports something to the user, the event created for this event will have the same site number as the internal source number. 
It is highly recommended to create sites in the Security Center, the numbers of which correspond to the internal numbers of the event sources - this will allow to monitor the occurrence of errors that occur during the source operation, as well as receive service information about their work.

The "Control time" parameter allows to automatically monitor the fact of receiving events by the source and inform the operator about problems encountered during reception. If, for some reason, no events are received for the event interval specified by this parameter, a system event with "ZZXH" code and the site number corresponding to the internal number of the event source will be created.

Use "Client number shift" parameter to specify a positive integer that will be automatically added to the site number for each event accepted by the event source. 
It is recommended to use the shift of site numbers if several central monitoring panels, including different panels, are to be connected to one copy of the Security Center software. By setting different shifts of site numbers for different event sources, it is possible to avoid the problem of overlapping of the same numbers of different sites operated on different panels.

For example, two Lonta-202 remote controllers are connected to the Security Center. Ranges of site numbers that can be connected to panels are the same - from 1 to 600. But if the event number shift equal to 1000 is set for one source of events, and 2000 for the other, then we will work with sites 1001-1600 for one panel and 2001-2600 for the other in the Security Center.

"Channel number shift" is a parameter that specifies a positive integer that will automatically be added to the receive channel number. 
If the channel number shift number is set to zero, then the events received by the event source will use the channel number transmitted by the receiving equipment of the central station or the first channel number if the equipment does not transmit the channel number.
By setting different channel number shifts for different event sources, it is possible to distinguish the event sources (and the connected panels) for the received events.
The channel number shift is especially relevant when using several identical event sources, since the types and numbers of the communication channels used by these sources will most likely be identical. 

It is possible to enable or disable the event source using the "Enable event source" parameter. It shall be noted that if the event source is turned off, then all resources used by it are released.

### Event Source from PimaGuard and Sentinel

PimaGuard and Sentinel event source is intended for receiving events via serial port or Ethernet network from the software from the following list:

- "Mcard for MS-DOS";
- «Pima NetSoft» (transmitters «GSM-200» and communicators «Net4Pro»);
- "Pima IP Receiver" (control panels "AlarmView" "Guardian");
- "PimaGuard for Windows" ("Andromeda" protocol).

This is the most up-to-date source for receiving events from the receiving equipment of Pima central station, which includes all features of the "Event Source from CMS-420", which is no longer supplied as part of the Security Center. If it is necessary to support the newest features of the receiving equipment of the central station, as well as the full range of protocols and channels for the transmission of notifications implemented by Pima receiving equipment, it is necessary to use the "Event sources from PimaGuard and Sentinel".

\imgcapt{img/EventSource-03-02.png}{"PimaGuard event sources properties" window, "Connection" tab, "Serial port" connection type}

The "Connection Method" parameter specifies the method with which the receiving equipment connects to the Security Center: via serial port or network that supports the TCP/IP protocol.

If serial port is used, use the "Port number" parameter to select the serial port to which the receiving equipment of the central station is connected, and use the "Port baud rate" parameter to set the exchange rate.

\imgcapt{img/EventSource-03-03.png}{"PimaGuard event sources properties" window, "Connection" tab, "TCP/IP server" connection type}

When connecting the receiving equipment via Ethernet, it shall be remembered that the "Event Source from PimaGuard and Sentinel" always acts as TCP/IP server, that is, it waits for incoming connections.
If several network adapters are installed on the computer, or if one adapter uses multiple IP addresses, use the "Interface address" parameter to specify the IP address where the event source shall wait for incoming connections. 
The "Server port" parameter is intended to indicate the port to which the receiving equipment of the central station will be connected.

When using PimaGuard source in the event receiving mode via Ethernet, it is recommended to use a separate instance of the event source for each instance of the sending software.

### Event Source via TCP/IP

"Event source via TCP/IP" is intended for receiving events via TCP/IP-compatible network from the following C.Nord equipment:

* GSM transmitters "TR-100 GSM" and "TR-100 GSM II" - via GPRS

* Panic button "Button" - via GPRS channel

* Repeater "Tsefei" - via Ethernet channel

If this event source is used, the central monitoring panel usually requires a dedicated IP address on the Internet. Besides, it is recommended to connect different types of equipment to different instances of the event source, and when connecting the "Tsefei" repeater, it is best to use a separate instance of the event source for each repeater.

\imgcapt{img/EventSource-04-01.png}{Event source via TCP/IP properties window, "Receiver setting" tab}

"Event source via TCP/IP" always acts as a TCP/IP server, that is, it waits for incoming connections.
If several network adapters are installed on the computer, or if one adapter uses multiple IP addresses, use the "Interface address" parameter to specify the IP address where the event source shall wait for incoming connections. 
The "Server port" parameter is used to specify the port to which the connection will be expected.

Use the "Receive channel type" parameter to explicitly specify the type of communication channel that is used when transmitting messages from the site equipment.  
For example, the "Event Source via TCP/IP" can receive events from transmitters TR-100 GSM via GPRS channel and from repeaters "Tsefei" via Ethernet. The event source cannot identify the communication channel that is used for transmission. Therefore, when configuring this event source, it is necessary to explicitly specify the type of communication channel that is used for transmission: GPRS if the source is intended for receiving events from TP-100GSM, and Ethernet, if the source receives data from the "Tsefei". 

The "Receive channel number" parameter is used to specify the number that will be used to identify the channel on which the event was received. The parameter value is especially useful if several event sources are used via TCP/IP: to distinguish between sources from which the event was received it is necessary to set different receive channel numbers for them.

### GuardBox Events Source

"GuardBox events source" is intended to receive events via the serial port from the GuardBox software.

This event source guarantees transmission of events from the receiving equipment of the central station. Besides, it provides a number of other functions, for example, time synchronization with the central station computer.

\imgcapt{img/EventSource-13-01.png}{"GuardBox Events source Properties" window, "GuardBox" tab}

Use "Port" parameter to select the serial port to which the computer, on which the GuardBox is running, is connected, and use the "Connection baud rate" parameter to set the exchange rate.

The "Check Security Center functioning" parameter is intended to enable or disable monitoring of the Security Center by the GuardBox software. 
The monitoring includes connection to the "Event manager" module over the network and generation of queries about functioning of the "Event Manager" and "Duty operator" modules. 
Information about the results of the performed check is transferred to the GuardBox software. If the check is completed with an error, the GuardBox software informs about it visually and with a sound signal.

### GSM Events Source

"GSM Events Source" is intended for reception of events via GSM SMS and CSD channels from the "Nord GSM", "Soyuz GSM" and "TR-100 GSM IV" - via CSD channel.

It shall be noted that in order to use the GSM event source, it is necessary to connect GSM-modem SonyEricsson GT-47, Siemens MC35, or compatible with them by the command system to the computer.

\imgcapt{img/EventSource-14-01.png}{"GSM events source properties" window, "GSM-modem" tab}

The "GSM-modem" parameter defines the type of GSM-modem connected to the event source.

Use "Communication port" parameter to select the serial port to which the GSM-modem is connected, and "Baud rate" parameter to set the exchange rate.

The parameter "Modem re-initialization interval" allows to forcefully re-initialize the events of the GSM-modem connected to the source with a specified interval.

Check "Enable serial port I/O log" option to save exchange protocol of the event source with the GSM-modem to the hard disk. 
This information is useful when finding out the causes of problems when connecting to a GSM-modem or sending SMS messages through it. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

\imgcapt{img/EventSource-14-02.png}{"GSM events source properties" window, "SIM-card" tab}

Using the "Phone number" parameter to specify the phone number of the SIM card installed in the GSM-modem. This parameter is required to generate commands for the "PT-300" buttons sent via SMS.

The "Service center address" parameter allows to set the phone number of the SMS-center of the mobile operator, which SIM card is installed in the GSM-modem. Some communication operators require that this parameter be set so that the function of sending SMS messages works correctly. The phone number that is used as the value of the "Service center address" parameter shall be specified in full, international format. The symbol "+" shall not be used when specifying this number.

If the SIM card installed in the GSM-modem is protected by a personal identification code, it can be set as the value of the "SIM PIN" parameter. It is strongly recommended not to use SIM cards protected by PIN code to avoid problems associated with the loss of set codes.

### Sur-Gard events source

It is intended for receiving events via the serial port from the receiving equipment of the Sur-Gard central stations manufactured by DSC up to and including System III.
Since the data transmission format used by Sur-Gard central stations is the de facto standard, this event source can be used to receive events from hardware and software from a variety of vendors: "Ritm", "Proksima", Jablotron, etc. 

\imgcapt{img/EventSource-09-01.png}{Sur-Gard events source Properties window, "Sur-Gard" tab}

Use the "Serial port" parameter to select the serial port to which the receiving equipment of the central station is connected, and use the "Port baud rate" parameter to set the exchange rate. The amount of data bits in the transmitted bytes can be specified with the "Data bits" parameter, the transmission parity can be specified by the "Parity" parameter, and the "Stop bits" parameter is used to determine the amount of stop bits.

If hardware control of the data flow is used when communicating via a serial port, it is necessary to check the "Enable hardware flow control (CTS/RTS)" box.

\imgcapt{img/EventSource-09-02.png}{Sur-Gard events source Properties window, "Extra settings" tab}

Use the "Extra settings" tab to specify the types of communication channels that are used by the receiving equipment of the central communication when receiving signals from the site equipment.

### LONTA-202 Events Source

"LONTA-202 events source" is intended for receiving events via serial port from the central monitoring panels Lonta PRO, Lonta Optima and LONTA-202 manufactured by Altonika. 

It shall be noted that if you use the Sentinel software together with any Altonika panel and want to switch to the Security Center software, then you need to know about the possibility of automatic data import from the "Strazh" software. See the description of the "Database wizard" module, with which the data are important, for more information about this function.

\imgcapt{img/EventSource-06-01.png}{LONTA-202 events source Properties window, "LONTA-202" tab}

Use "Serial port" parameter to select the serial port to which the central monitoring panel is connected, and "Port baud rate" parameter to set the exchange rate.

### RS-200 Events Source

"RS-200 events source" is intended for receiving events from the central monitoring panel RS-200 manufactured by Altonika. It shall be noted that the event source supports the entire spectrum of equipment that transmits signals to the RS-200 panel.

\imgcapt{img/EventSource-08-01.png}{RS-200 events source Properties window, "RS-200" tab}

Use "Serial port" parameter to select the serial port to which the central monitoring panel is connected, and "Port baud rate" parameter to set the exchange rate.

Site number shift "is a positive integer that is automatically added to the site number for each event accepted by the event source. 

### RC 4000 Events Source

"RC 4000 events source" is intended for receiving events via serial port from the central monitoring panel RC 4000 manufactured by Visonic. 

If you use the RC 4000 panel together with CSM32 software and want to switch to the Security Center software, then you need to know about the possibility of automatic data import from the CSM32 software. See the description of the "Database wizard" module, with which the data are important, for more information about this function.

\imgcapt{img/EventSource-07-01.png}{RC 4000 events source Properties window, "RC 4000" tab}

Use "Serial port" parameter to select the serial port to which the panel is connected, and "Port baud rate" parameter to set the exchange rate.

If hardware control of the data flow is used when communicating via a serial port, it is necessary to check the "Enable hardware flow control (CTS/RTS)" box.

Check "Log I/O" option to save exchange protocol of the event source with the central monitoring panel to the hard disk. This information is useful when finding out the causes of problems when receiving events from the panel. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

Use the "RC 4000 channel types" tab to specify the types of communication channels that are used by the panel when receiving signals from the site equipment.

### Multiprotocol Event Source

"Multiprotocol event source" is intended for receiving events via serial port from the following central monitoring panels 

* Silent Knight 9500 (Honeywell)

* RCI4000/RCI5000/DTRCI5000 (KP Electronics)

* Blitz (radio channel) (PKS)

* AES-Intellinet (radio channel)
 
Besides, this event source supports reception of data via some other common protocols, for example, Ademco 685 protocol.

\imgcapt{img/EventSource-05-01.png}{"Multiprotocol events source Properties" window, "Receiver" tab}

Use the "Serial port" parameter to select the serial port to which the receiving equipment of the central station is connected, and use the "Port baud rate" parameter to set the exchange rate. The amount of data bits in the transmitted bytes can be specified with the "Data bits" parameter, the transmission parity can be specified by the "Parity" parameter, and the "Stop bits" parameter is used to determine the amount of stop bits.

If hardware control of the data flow is used when communicating via a serial port, it is necessary to check the "Enable hardware flow control (CTS/RTS)" box.

## Event Handlers

After the "Event manager" module accepts notification from the central monitoring or control panel, it decodes and describes the notification in accordance with the event template specified for the site from which the notification was received. The event resulting from the decoding of the notification can be automatically handled in the "Event manager" module with the help of special module components called event handlers.

To access the settings of event sources select the "Event handlers..." item in the module menu that appears after right-clicking on the module icon in the system tray of the taskbar.

To access the "Event handlers" window, the user shall have permission to "View event handlers" for the "Event manager" module.

To save the changes, made in the "Event handlers" window, the user shall have permission to "Edit event handlers" for the "Event manager" module.

\imgcapt{img/EventHandler-01.png}{"Event handlers" window}

The "Search" area of the "Event Handlers" window is intended to search for a group or event handler in the list. If you click on the "Start" button, the search will be performed from the very beginning of the list. If you click on the "Find next" button, the search will start from the current selected item in the list of handlers.

The Security Center event handlers are controlled with the buttons of the control panel, located at the top of the "Handler groups" area of the "Event Handlers" window.

Click the "Show hidden handler groups" button to display the handlers marked as hidden in the list. 
To enable display of the hidden event handler groups, the user shall have permission to "View hidden event handlers" for the "Event manager" module.
It shall be noted that the permission to "Edit event handlers" applies only to those event handlers that the user can view. Thus, the user can be granted permission to make changes to the handlers of "SMS message repeater" and hide others, critical for the Security Center, such as "Pandora Network" or "Alarm entering".

Use the "Move up the list" and "Move down the list" buttons to change the order of the handlers in the display list. This order is important, since each event is sent to the event handlers in turn, in the order in which the handlers appear in the list. 
For example, if the "Event chain monitor" handler is configured to monitor the "Alarm reset" event after the "Alarm" event, then it shall be in the list before the "Alarm entering" handler, since the latter can change the class of the received event .

The "Create group" button is intended to add a new group of event handlers to the list. And the button "Create handler" allows to add a new handler to the group.
There are no restrictions on the number of groups of handlers in the list or the number of handlers in the group, they can be created as many as necessary.
The event handler group defines an algorithm according to which the event will be handled. Besides, the group settings define the resources that will be used during handling. For example, device for SMS sending is specified in the "SMS message repeater" event handler, and this device will be used to send messages to all handlers in the group.
As for the handlers in the group, they define the settings for the event handling that is performed with respect to specific sites. In this case, the settings of different handlers do not depend on each other. For example, events from the same site can be handled by different handlers from the same group. 
Combining of handlers into a group is also useful when event handlers need to be hidden or disabled: the group is hiding together with the handlers that it includes, and if the event handler group is disabled, the handlers included in it will not function, even if they themselves are enabled.

Use "Paste copy of selected item" button to copy the current item selected in the list. If this is an event handler, then its copy will be inserted into the same event handler group, except that the new handler will be disabled. If a group of handlers is selected in the list, a copy of the group will be inserted into the list. In this case, the state of the group handlers will be preserved, but the new group of event handlers will be turned off.

Click on the "Properties" button to configure the group of event handlers or a separate handler.

The "Delete selected item" button allows to remove the selected group of event handlers or a separate handler in the group from the list. Be careful, when you delete an event handler group, all event handlers included in it will be deleted. 
Due to the fact that deleting event handlers is accompanied by cleaning the database from their settings, deleting some groups of event handlers can take a long time.

The list of event handlers supports several operations that can be performed with the mouse. For example, it is possible change the order of items in the list, and move event handlers from one group to another.

### Common Settings for Event Handler Groups

\imgcapt{img/EventHandler-02-01.png}{"Parameters of group" window, "Common" tab}

As a value for the "Name of group" parameter it is allowed to specify a string that will be displayed in the list of handlers in the "Event Handlers" window. In the group name of event handlers, it is recommended to include key information that characterizes the group to distinguish one group from another, for example, the parameters of the resources used by the group. 

The "Description of group" parameter is used to store detailed information about the group of event handlers.  

The "Internal number" parameter is required to identify the group of event handlers by Security Center and the user. When the group reports something to the user, the created event will have the same site number as the internal group number. 
It is highly recommended to create sites in the Security Center, the numbers of which correspond to the internal numbers of the event group - this will allow to monitor the occurrence of errors that occur during the handler operation, as well as receive service information about their work. 
As an event template for sites which numbers correspond to the internal numbers of the event handler groups, it is recommended to use the "Event Handlers" template.

When searching in the "Event handlers" window, the search query browses the values of the "Name of group", "Description of group" and "Internal number" parameters.

The group of event handlers can be enabled or disabled by the "Group is enabled" parameter. It shall be noted that if the group of event handlers is disabled, then all resources used by it are released and the event handling by the group is terminated. In this case, the handlers included in the group can be enabled, since the handler state does not influence event handling by the disabled group.

If "Hidden Group" parameter is set for a handler group, it is possible to hide this handler group from the list in the "Event handlers" window for those users who do not have permission to view the hidden groups of event handlers.

Use the "Disable handling events from disabled sites" to disable event handling from sites that are disabled. This function can be useful for almost all handlers, since it allows to automatically exclude disabled sites from handling. The site is disabled in the "Site manager" module on the "Arm" tab. See "Site Manager" section of this manual for more information about disabling sites.

### Common Event Handler Settings

\imgcapt{img/Eventhandler-02-08.png}{"Parameters of handler" window, "Common" tab}

As a value for the "Name of handler" parameter it is allowed to specify a string that will be displayed in the list of handlers in the "Event Handlers" window. In the name of the event handler, it is recommended to include key information that characterizes it and allows to distinguish one handler from another, for example, the number of the site, which events are handled by the handler. 

The "Description of handler" parameter is intended for storing detailed information about the event handler.  

The "Internal number" parameter is required to identify the handler by Security Center and the user. When the handler reports something to the user, the created event will have the same site number as the internal handler number. 

The event handler can be enabled or disabled by the "Handler is enabled" parameter. It shall be noted that for the operation of the event handler, it is necessary that both the handler and the event handler group, into which it is included, are enabled.

#### Sites

\imgcapt{img/Eventhandler-02-09.png}{"Parameters of handler" window, "Sites" tab}

The "Sites" tab is used to specify the numbers and intervals of the site numbers, which events will be handled. 
To add a number or an interval of site numbers to the list of handled ones, it is necessary to enter it in the input field in the right part of the window and click on the "Add" button. When entering site numbers, it is allowed to enumerate several numbers or numbers and intervals of numbers separated by commas, for example: "100, 102, 104, 106-100, 200-299".
To delete a number or an interval of site numbers from the list of the handled ones, it is necessary to select the line with the value, which shall be deleted in the list, located in the left part of the window, and click on the "Delete" button.

#### Channels

\imgcapt{img/Eventhandler-02-11.png}{"Parameters of handler" window, "Channels" tab}

The "Channels" tab is intended to specify the types of communication channels via which the events to be handled shall be received. To allow the handling of the events received via a particular communication channel, it is necessary to check the appropriate channel name.

The "Channel filtration interval" parameter is intended to exclude from handling the identical events received via different communication channels. If this parameter value is greater than zero, only the first event received will be handled, all other events, received during the specified interval, will be ignored. For example, if two communication channels are used for transmitting messages from the site: radio and telephone and the value of the "Channel filtration interval" parameter is 1 minute, the message received by radio will be handled, and the message received by phone will be ignored (if it comes within one minute).
The "Channel filtration interval" parameter is recommended for use in event handlers "SMS message repeater".

#### Schedule

\imgcapt{img/Eventhandler-02-13.png}{"Parameters of handler" window, "Schedule" tab}

If the event handler shall be set up so that event handling is performed only at a specified time, set the handler schedule on the "Schedule" tab.

Click the "Add" button to add the interval of the event handler to the list. For each interval, it is necessary to specify the day of the week to which it relates, as well as the start and end time of its operation.

The "Delete" button is used to delete the interval of the event handler from the list.

Use the "Use schedule" option to enable or disable the use of the schedule by the handler. If the use of the schedule by the event handler is disabled, then it works constantly. If the use of the schedule is enabled, but there is not a single interval for the work, the event handler will never be enabled.

### Event Monitoring

This handler monitors periodic reception of the event of a given class and generates a system event in the absence of it. 

The handler can be used to solve the following tasks:

* "Guard monitoring". The task of guard monitoring is often reduced to a simple monitoring of the periodic reception of a given event. In this case, despite the fact that the sequence of event reception is not monitored, it is possible to monitor the guards even on a complex route by selecting the intervals for receiving events.

* "Automatic test monitoring" Unlike the control time of a site that implies the arrival of any event from the site via any communication channel, it is possible to monitor the periodic arrival of a particular event, and specify the communication channel via which this event is to be received.

The settings of the "Event monitoring" event handler group completely coincide with the general settings of the event handler groups, which are discussed in detail above.

The settings for the "Event monitoring" event handler also largely coincide with the general settings of the event handlers discussed above, except for the "Event monitoring" tab.

\imgcapt{img/Eventhandler-04-01.png}{"Parameters of handler (Event monitoring)" window, "Event class" tab}

* The event handler, configured as shown in the figure, will monitor the arrival of the "Connection control" event class every 30 minutes. A period from 25 to 34 minutes after receiving the previous event will be considered valid for the next event. *

The "Event class" parameter specifies the event class that the event handler monitors.

Use the "Zone number" parameter to limit the list of events monitored by the handler. If this parameter value is not set or equal to zero, then the handler monitors the reception of any events, which class corresponds to the value of the "Event class" parameter. If the "Zone number" parameter is set to the zone value, only those events that have a zone number corresponding to the specified zone will be monitored.

The "Interval" parameter defines the interval during which the event handler shall receive monitored events. 

The "System code" parameter specifies the system event code that will be created if the next event is not received by the handler. 
When creating a system event, the communication channel "System" and the number of the site, from which the monitored event is not received, are used. 
The system event will be decoded according to the event template specified for the site on which the event was created.

The "Left deviation" and "Right deviation" parameters are intended to configure the exact monitoring interval for receiving the monitored events. 
If the value of the "Left deviation" parameter is not equal to zero, then only the event, that is be accepted not earlier than the value of the interval minus the left deviation, will be counted as received. For example, if the event arrival is monitored every 30 minutes and the left deviation is 5 minutes, then only the event, that is received not earlier than 25 minutes after the previous one, will be counted as accepted.
If the value of the "Right deviation" parameter is not zero, then the event, that is be received later than the value of the interval plus the right deviation, but not more, will be counted as accepted. For example, if the event is monitored every 30 minutes and the right deviation is 5 minutes, the event, received 34 minutes after the previous one, will be counted as accepted.

If the "Shift interval counting time" parameter is set, then the new timeout interval of the event will be counted from the moment of the previous event reception. If the parameter is not set, then the interval count is related to the moment the handler is enabled.
If the events monitored by the handler are created by the person, it is recommended to set the "Shift interval counting time" parameter, so that the event handler ignores inaccuracies and deviations related to the presence of the human factor. If the events created by the equipment are monitored, then it is not necessary to set the "Shift interval counting time" parameter.

Setting the permissible deviations and shifting the beginning of the interval are most often needed for tasks similar to the "Guard monitoring" task: there is an interval during which a round is made, there are permissible deviations. If the monitoring button is pressed ahead of time, it is ignored and it is possible to press it a bit later. At the same time, the new interval will be counted from the moment when the security guard confirmed the completion of the previous one.

### Event Chain Monitoring

This handler is intended to monitor the time sequence (chain) of received events and the generation of system messages in case of violation.
The handler is intended for solving tasks such as:

* "Monitoring of paired events". For example, monitoring the restoration of 220V or other faults at the site. Use the "Event chain monitoring" handler for automatic distinguishing between short-term faults from fatal ones, for example, for detection sites where the power supply is not available for too long.

* "Guard monitoring". The use of this handler allows to monitor the movement of the guard along the route, taking into account the correct sequence of the round.

The settings of the "Event monitoring" event handler group completely coincide with the general settings of the event handler groups, which are discussed in detail above.

The settings for the "Event monitoring" event handler also largely coincide with the general settings of the event handlers discussed above, except for the "Class chain" tab.

\imgcapt{img/Eventhandler-05-01.png}{"Parameters of handler (Event chain monitoring)" window, "Class chain" tab}

* The event handler, configured as shown in the figure, is waiting for an event with the "AC disconnected" class. If within 5 hours (300 minutes) after receiving it from the site, event with the "AC Restore" class is not received, the handler will create a system event with the "ZZBB" code. The handler configured in this way allows the personnel of the monitoring station to be warned about a prolonged power outage at the site.*

The "Class chain" tab displays a sequence of event classes, the receiving of which is monitored by the handler, and the event handler waits for the events exactly in the order in which they appear in the list.

Unlike the "Event control" event handler, which starts the waiting interval for the monitored event immediately after enabling, the "Event chain monitoring" event handler is enabled only after the first event in the chain is received. The fact of receiving the first event in the chain by the handler is not monitored in any way.

Use the "Add event class to chain" button to add a new event class to the end of the chain of monitored events.

Click on the "Event class properties" button to view and change the parameter values of the selected event class in the list.

The "Delete" button is used to delete an event class from the chain.

Use the "Event class properties" window to view and change the properties of the event class:

\imgcapt{img/Eventhandler-05-02.png}{"Event class properties - Event chain monitoring" window}

The "Name of class" parameter specifies the event class that the event handler monitors.

Use the "Zone number" parameter to limit the list of events monitored by the handler. If this parameter value is not set or equal to zero, then the handler monitors the reception of any events, which class corresponds to the value of the "Event class" parameter. If the "Zone number" parameter is set to the zone value, only those events that have a zone number corresponding to the specified zone will be monitored.

The "Interval" parameter defines the interval during which the event handler shall receive monitored events. 

The "System code" parameter specifies the system event code that will be created if the monitored event is not received by the handler. It shall be noted that it is possible to specify a separate system event code for each event class in the chain. This allows to inform the operator about the details of the violation and offer him different algorithms for handling the situation.
When creating a system event, the communication channel "System" and the number of the site, from which the monitored event is not received, are used. 
The system event will be decoded according to the event template specified for the site on which the event was created.

The "Left deviation" and "Right deviation" parameters are intended to configure the exact monitoring interval for receiving the monitored events. 
If the value of the "Left deviation" parameter is not equal to zero, then only the event, that is be accepted not earlier than the value of the interval minus the left deviation, will be counted as received. For example, if the event arrival is monitored in 30 minutes and the left deviation is 5 minutes, then only the event, that is received not earlier than 25 minutes after the previous one, will be counted as accepted.
If the value of the "Right deviation" parameter is not zero, then the event, that is be received later than the value of the interval plus the right deviation, but not more, will be counted as accepted. For example, if the arrival of the event is controlled after 30 minutes and the deviation to the right is 5 minutes, the event received 34 minutes after the previous one will be counted as received.

If the "Shift interval counting time" parameter is set, then the new timeout interval of the event will be counted from the moment of the previous event reception. If the parameter is not set, then the interval count is related to the moment the handler is enabled.
If the events monitored by the handler are created by the person, it is recommended to set the "Shift interval counting time" parameter, so that the event handler ignores inaccuracies and deviations related to the presence of the human factor. If the events created by the equipment are monitored, then it is not necessary to set the "Shift interval counting time" parameter.

Just like the system event code, the values of the permissible deviation parameters and the shift interval counting time can be specified independently for each class in the chain.

Setting the permissible deviations and shifting the beginning of the interval are most often needed for tasks similar to the "Guard monitoring" task: there is an interval during which a round is made, there are permissible deviations. If the monitoring button is pressed ahead of time, it is ignored and it is possible to press it a bit later. At the same time, the new interval will be counted from the moment when the security guard confirmed the completion of the previous one.

#### Monitoring of connection with C.Nord GSM devices

The "Event chain monitoring" event handler can be used to monitor connection to devices that use "C.Nord GSM (CML)" protocol.

When the device is connected to the event source, a system event with the "ZZWE" code is created, which by default is described with the "Connection established" event class. When the transmitter is disconnected, a system event with the "ZZWF" code is generated, which is described with the "Connection lost" event class.

Thus, there is all necessary information for monitoring the communication channel: if connection with the transmitter is lost and not restored within a given period of time, it is necessary to get information about it.

\imgcapt{img/EventHandler-05-03.png}{"Parameters of handler (Event chain monitoring) for monitoring connection window}

*The event handler, which is configured as shown in the figure, will create an event with the "ZZXA5" code (event class - "Connection alarm", event description - "No events via GPRS"), if connection with the transmitter is not restored within 5 minutes after it has been lost.*

### Alarm Entering

The "Alarm entering" event handler allows to suspend handling of an alarm event by the "Event Manager" module and wait for disarming, which can be received immediately after the alarm.

The purpose of this event handler is to save the duty operator from having to respond to deliberately false alarms that occur when the sites are disarmed.

This handler shall be used for those sites where security tactics, which excludes entry delay, is used. Besides, the use of this handler is justified for all sites where a staff error is possible during disarming.

The settings of the "Alarm entering" event handler group completely coincide with the general settings of the event handler groups, which are discussed in detail above.

The settings for the "Alarm entering" event handler also largely coincide with the general settings of the event handlers discussed above, except for the "Class chain" tab.

\imgcapt{img/Eventhandler-03-02.png}{"Parameters of handler (Alarm entering)" window}

* If the event handler is configured as shown in the figure, then when an event with the "Alarm" class is received on the first zone, the handler will be enabled and will replace the class for the received event with "Delayed alarm". If after that the event with the class "Disarming" is not received within 45 seconds, the event with the "Alarm" class will be newly created by the handler and sent to the operator for handling. If the event with the class "Disarming" is received, the handler will stop working until the next event with the class "Alarm" is received.*

The "Alarm event class" parameter specifies the class of the event, which handling is suspended by the operator and Security Center. 

Use the "Zone number" parameter to determine the event to be handled accurate within a zone: if this parameter value is not set or equal to zero, then any event, which class coincides with the value of the "Alarm event class" parameter, will be accepted for handling. If the "Zone number" parameter is set to the zone value, only the event with the zone number corresponding to the specified one will be handled.

For the event accepted for handling, the event class is replaced. The value of the "Replacement event class" parameter determines which class the event will have after its handling.

After the "Alarm entering" event handler receives an alarm event and replaces the class for it, it starts the countdown of the wait interval for the event which class is set by the value of the "Disarming" event class. 
If the event with such a class is not received during the interval specified by the value of the parameter "Disarm wait interval", the handler will create a system event, in which the code, class, zone number and description will be copied from the event, which handling was suspended. Only the date and time of the event will differ - they will correspond to the event time of the handler, and the event receiving channel - the value of this event parameter will be set to "System".

### SMS Message Repeater

The "SMS message repeater" handler allows to send information about the received events to a mobile phone in the form of SMS messages.

With the help of the "SMS message repeater" handler, it is possible to provide an additional service to the clients of the security company, for example, informing the responsible persons about the site arming and disarming.
Besides, with the help of this handler, it is possible to transmit alarms directly to the mobile phone of the Guard in parallel with the work of the duty operator.

Also, this handler can greatly simplify the commissioning of equipment on the connected sites. If the engineer has a personal number of the site that he/she shall use when checking the equipment at the site, and SMS messages for the events received from this site are sent to his/her mobile phone, it will allow to perform the equipment configuration without the duty operators.

#### Device for Sending SMS Messages

The event handler can send SMS messages using one of the devices connected directly to the operating computer:

* GSM-modems «iRZ TU31»

* GSM-terminals based on GSM-modem "Siemens MC35" or compatible with it

* GSM-modem "SonyEricsson GM-22"

* GSM-modem «SonyEricsson GR-47»

* Nokia mobile phones

To send SMS messages, special device drivers are used, which are called "transceivers". Each supported device has an appropriate transceiver, which is intended to connect to the device.

In addition to working with hardware devices, the handler can connect to send SMS messages to the "Phoenix" software or directly to the SMS-server of the mobile operator via SMPP protocol. There are also corresponding transceivers for each of these ways of sending SMS messages.

Settings on the "Device" tab allow to determine the way in which SMS messages will be sent, as well as the necessary parameters.

##### GSM-modem

\imgcapt{img/Eventhandler-02-02.png}{"Parameters of group (SMS message repeater)" window, "Device" tab, parameters of SMS transceiver over modem MC35}

Use the "Serial port" parameter to select the serial port to which the GSM-modem is connected, with which SMS messages will be sent, and using the "Baud rate" parameter to set the exchange rate.

If the SIM card installed in the GSM-modem is protected by a personal identification code, it can be set as the value of the "SIM code" parameter. It is strongly recommended not to use SIM cards protected by PIN code to avoid problems associated with the loss of set codes.

The "Service center address" parameter allows to set the phone number of the SMS-center of the mobile operator, which SIM card is installed in the GSM-modem. Some communication operators require that this parameter be set so that the function of sending SMS messages works correctly. The phone number that is used as the value of the "Service center address" parameter shall be specified in full, international format. The symbol "+" shall not be used when specifying this number.

Check "Logging of exchange with the modem" parameter to save the exchange protocol of the event handler with the GSM-modem to the computer hard disk. This information is useful when finding out the causes of problems when connecting to a GSM-modem or sending SMS messages through it. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

The parameters of the transceivers intended for connection to the modems "SonyEricsson GM-22" and "SonyEricsson GR-47" are completely similar to the configuration parameters of the modem "Siemens MC35".

It shall be noted that several groups of event handlers "SMS message repeater" can use the same GSM-modem for sending SMS messages. Thus, when determining the required number of GSM-modems, take into account only the bandwidth of the used device. For the modem "SonyEricsson GR-47" it is possible to take into account 5-7 SMS messages per minute, and for the modem "Siemens MC35" this value is 10-12 SMS messages per minute.

##### Phoenix Software

The "Phoenix" software was developed by C.Nord and is intended for organizing a pool of channels for receiving and transmitting SMS messages. It is supplied as part of "Andromeda MS" software and "Andromeda Persona" software. 
Connection to the "Phoenix" software is carried out over a network that implements the TCP/IP protocol, while a copy of the "Phoenix" software always acts as a TCP/IP server, waiting for connection.
The characteristic of the "Phoenix" software is the ability to reserve channels for sending SMS messages, that is why the parameters of the transceiver intended for sending SMS messages over the Phoenix software are divided into two identical groups. One group of parameters is intended for setting the main channel for sending SMS messages, and the second for the backup channel.

\imgcapt{img/Eventhandler-02-03.png}{"Parameters of group (SMS message repeater)" window, "Device" tab, parameters of SMS transceiver over Phoenix software}

The "Address" parameter is used to specify the NetBIOS name of the computer, on which the instance of the Phoenix software is running, via which it is necessary to send SMS messages. Instead of the NetBIOS name of the computer, it is allowed to specify its IP address. Use the "Port" parameter to specify the port to which you want to connect.

Check "Logging of the operation" parameter to save the exchange protocol of the event handler with the "Phoenix" software to the computer hard disk. 
This information is useful when finding out the causes of problems when connecting to the "Phoenix" software or sending SMS messages through it. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

##### Nokia Phones

"SMS transceiver over Nokia phones" is intended for sending SMS messages using some Nokia mobile phone models.

Supported phone models: 1100, 1220, 1260, 1261, 2100, 2270, 2275, 2280, 2285, 2300, 2600, 2650, 3100, 3105, 3108, 3200, 3205, 3210, 3220, 3300, 3310, 3320, 3330, 3350, 3360, 3390, 3395, 3410, 3510, 3510i, 3520, 3530, 3560, 3570, 3585, 3585i, 3586, 3586i, 3587i, 3588i, 3589i, 3590, 3595, 3610, 5100, 5110, 5130, 5140, 5190, 5210, 5510, 6100, 6108, 6110, 6130, 6150, 6190, 6200, 6210, 6220, 6225, 6230, 6250, 6310, 6310i, 6320, 6340, 6340i, 6360, 6370, 6385, 6500, 6510, 6560, 6585, 6590, 6610, 6610i, 6650, 6651, 6800, 6810, 6820, 7110, 7160, 7190, 7200, 7210, 7250, 7250i, 7260, 7600, 8210, 8250, 8290, 8310, 8390, 8810, 8850, 8855, 8890, 8910, 8910i.

Supported methods of connecting mobile phones to computer:

- DAU-9P-compatible cable (FBUS mode);

- DLR-3 cable (DLR-3P) (for the models 6210, 6250, 6310, 6310i, 7110, 7190);

- Infrared port;

- Bluetooth (for models 6310i with firmware version 5.50 and higher, 8910i);

- DKU-5 cable.

\imgcapt{img/Eventhandler-02-04.png}{"Parameters of group (SMS message repeater)" window, "Device" tab, parameters of SMS transceiver over Nokia phones}

Use the Serial Port option to select the serial port to which the Nokia mobile phone is connected to send SMS messages, and use the "Method of connection" parameter to specify the way that this phone is connected to the computer.

The "Service center address" parameter allows to set the phone number of the SMS-center of the mobile operator, which SIM card is installed in the GSM-modem. Some communication operators require that this parameter be set so that the function of sending SMS messages works correctly. The phone number that is used as the value of the "Service center address" parameter shall be specified in full, international format. The symbol "+" shall not be used when specifying this number.

Check "Logging of the operation" parameter to save the exchange protocol of the event handler with the Nokia phone to the computer hard disk. 
This information is useful when finding out the causes of problems when connecting to Nokia phone or sending SMS messages through it. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

##### SMPP Protocol over TCP/IP

"SMS Transceiver over SMPP (TCP/IP)" transmits SMS messages by connecting to SMS-server of the mobile communication operator (SMSC) via SMPP version 3.4. The connection is over a network that supports the TCP/IP protocol.

The "SMSC" tab specifies the parameters required to connect the transceiver to the SMS-server of the mobile operator.

\imgcapt{img/Eventhandler-02-05.png}{"Parameters of group (SMS message repeater)" window, "Device" tab, parameters of device "SMS transceiver over SMPP (TCP/IP)", "SMSC" tab}

The "SMSC address" parameter allows to set the IP address or DNS name of the computer of the SMS-server of the mobile operator to which you are connecting, and the "SMSC port" parameter allows to specify the TCP/IP port to which it is necessary to connect.

The "System (system_id)" and "Password" parameters are the requisites identifying the system (subscriber) that is connecting to the SMS-server. These requisites are provided by the mobile operator during the preparation of the contract for the organization of connection to their SMS-server. 

Check "Logging of the exchange with SMSC" parameter to save the exchange protocol of the event handler with the SMS-server of the mobile communication operator to the computer hard disk. 
This information is useful when finding out the causes of problems when connecting to the SMS-server of the mobile communication operator or sending SMS messages through it. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

Use the "SMPP" tab to specify the parameters specific to the SMPP protocol. It is recommended to change these parameters only if the mobile communication operator has defined special values for them during the preparation of the contract for the organization of connection to their SMS-server.

\imgcapt{img/Eventhandler-02-06.png}{"Parameters of group (SMS message repeater)" window, "Device" tab, parameters of device "SMS transceiver over SMPP (TCP/IP)", "SMPP" tab}

The names of all parameters that can be changed on the "SMPP" tab correspond to the fields in the PDU SUBMIT_SM. Detailed description of the parameters and their format can be found in the specification for the SMPP protocol.

#### "Event Classes" Tab

On the "Event classes" tab, a list of event classes is displayed, upon reception of which the handler will generate SMS message for sending. 

\imgcapt{img/Eventhandler-02-10.png}{"Parameters of handler (SMS message repeater)" window, "Event classes" tab}

For each class of the class in the list it is possible to specify the number of the part, as well as the number of the zone or user - these parameters allow to more accurately determine the events which shall generate SMS messages.

If the value in the "Part" column is not set or equal to zero, then any events, which class corresponds to the one specified in the "Class" column, are handled. If the "Part" column is not set to zero, then SMS messages will be generated only for those events, which part number corresponds to the specified one.

A similar rule applies to the value in the "Z/U" column for specifying the zone number or user that triggered the event. 

Use the "Add event class" button to add a new event class to the list of handled event classes.

The "Delete" button is used to delete an event class from the list of the handled events.

#### "Message Parameters" Tab

Use the "Message parameters" tab to specify the parameters that determine the recipient, as well as the format and content of SMS messages generated by the handler.

\imgcapt{img/Eventhandler-02-12.png}{"Parameters of handler (SMS message repeater)" window, "Message parameters" tab}

Use the "Telephone number" parameter to set the phone number of the SMS message recipient. When specifying the value for this parameter, it is recommended to specify the phone number in the international format, including the "+" symbol at the beginning of the number.

The "Coding" parameter is used to select the encoding to be used for generating SMS messages. If the value for this parameter is "UCS2 (Cyrillic)", then the Cyrillic characters that are present in SMS messages will be saved unchanged. If "Translit" is specified as the value for this parameter, the Cyrillic characters in the SMS message will be transliterated, that is, they will be replaced with the corresponding Latin symbols. 

It shall be noted that the value of the "Coding" parameter is directly related to the maximum length of the SMS message that can be generated by the event handler: SMS message in the "UCS2" encoding can contain no more than 70 characters, while the maximum length of the message in the "Translit" encoding is 140 characters.

The maximum time during which SMS message is waiting for delivery to the recipient is specified by the parameter "Validity interval". It shall be noted that this interval is always counted from the moment the SMS message is generated by the handler. Besides, it does not depend on exactly where the SMS message is waiting for delivery to the subscriber: on the waiting list inside the event handler or on the server of the mobile operator: as soon as the validity interval of the SMS message expires, attempts to send it will be stopped.

The "Message format" parameter allows to set a template, according to which SMS messages sent by the handler will be generated. The value corresponding to the fields of the received event, such as the name of the event class or site number, can be substituted into SMS messages using special macros - if a macro is found while handling the message format string, it will be replaced with the value of the corresponding event field. 

List of macros supported by the event handler:

- %date% - date of event reception;

- %time% - time of event reception;

- %number% - site number;

- %name% - site name;

- %address% - site address;

- %phone% - site phone numbers;

- %channel% - name of channel via which event was received;

- %code% - event code;

- % lass% - event class name;

- %zoneuser% - number of zone or user that generated event;

- %description% - event description.

Click on the "Variables" button to display the menu, from which to select the contents of the macro that will be added to the value of the "Message format" parameter. Thus, it is not necessary to remember the correct spelling of the desired macro, but simply select it in the list and add it to the format string.

### Site Reclosing {#event-manager-reclosig}

The "Site reclosing" handler is intended for informing the responsible persons about site reclosing via SMS messages. With the help of this handler, the responsible persons are informed about the need to reclose the site and about the failure of the responsible persons to reclose.

If it is necessary to reclose the site, the event handler sends SMS message to all the responsible persons, who shall be notified about the need to reclose according to the settings in the "Site manager" module. SMS message is created in the format specified in the "Message parameters" tab of the "Parameters of handler" window. By default, the message about the need to reclose the site contains the site number, name and address.

If the responsible person refuses to reclose the site, the event handler sends SMS message to all responsible persons, who shall be notified about the need to reclose according to the settings in the "Site manager" module. SMS message is created in the format specified in the "Message parameters" tab of the "Parameters of handler" window. By default, the message about the refusal to reclose the site contains the surname and initials of the responsible person, as well as the site number, name and address.

#### Device for Sending SMS Messages

##### GSM-modem

The event handler can send SMS messages using the GSM-terminal based on the GSM-modem "Siemens MC35" (or compatible with it). The modem shall be connected directly to the computer with the event handler.

See details on sending SMS messages using the GSM-modem in the chapter on the "SMS message repeater" event handler.

##### SMPP Protocol over TCP/IP

To send SMS messages it is possible to use the connection to the SMS-server using the SMPP (TCP/IP) protocol.

See details on sending SMS messages over SMPP protocol in the chapter on the "SMS message repeater" event handler.

##### "Message Parameters" Tab

The "Message parameters" tab of the "Site reclosing" handler is similar to the "SMS message repeater" handler tab of the same name: the parameters defining the format and content of SMS messages generated by the handler are also set here. However, such parameter as "Telephone number" is not specified for the "Site reclosing" event handler. The mobile number of the responsible person is used as the phone number to which the SMS message shall be sent.

\imgcapt{img/Eventhandler-08-01.png}{"Site reclosing", "Parameters of handler (Sending parameters)" window, "Message parameters" tab}

See details on other message parameters in the chapter on the "SMS message repeater" event handler.

### Pandora Network

The main task of the "Pandora Network" event handler is to organize the information exchange between independent instances of the Security Center software. Events, operator actions and site descriptions can be transmitted from one Security Center to another.

Any channel that supports the TCP/IP protocol can be used as an information transfer channel. 

It is possible to precisely describe the amount of information that will be transmitted in the settings of the event handler. For example, it is possible to specify the numbers and intervals of the site numbers, events from which they will be transmitted, event classes required for the transfer, select the actions of the operators, which shall be transmitted. Reciprocal (simultaneous) transmission of information is possible.

First of all, the event handler is used when creating distributed monitoring systems - when several central monitoring panels are combined and it is necessary to collect operational information in a single unified dispatch center.

#### Parameters of Group

In the settings of the "Pandora network" event handler group it is possible to specify the settings for connection and information transmission, as well as the settings that are applied during handling of the received information.

##### "Site Numbers" Tab

On the "Site numbers" tab it is possible to specify a list of sites, information on which will be received by the group of handlers, as well as the values of the site number shift.

\imgcapt{img/Eventhandler-06-01.png}{"Parameters of group (Pandora network)" window, "Site Numbers" tab}

The "Site number - receive" field is intended for indicating the numbers and intervals of site numbers, information on which will be accepted by the event handler.

To add a number or an interval of site numbers to the list of received ones, it is necessary to enter it in the input field in the right part of the field and click on the "Add" button. To delete a number or an interval of site numbers from the list of received ones, select the line with the value that you want to delete in the list on the left of the field and click on the "Delete" button.

When entering site numbers, it is allowed to enumerate several numbers or numbers and intervals of numbers separated by commas, for example: "100, 102, 104, 106-100, 200-299".

It shall be understood that "site information" means any information transmitted by the "Pandora network" handler: events, site cards, operator actions for alarms. Thus, if it is assumed that the "Pandora network" event handler receives information, then the site numbers, on which information is received, shall be indicated in the "Site number - receive" field.

The "Shift before send" parameter specifies the value of the summand that will be added to the site number, before sending information about the site.

The "Shift before send" parameter specifies the value of the summand that will be added to the site number, after receiving information about the site.

Negative values can be specified for the "Shift before send" and "Shift after receive" parameters.

The use of site number shifts is especially useful if several central monitoring panels with the same number of protected sites are connected to the unified handling center using the "Pandora network" event handler. In this case, it is necessary to select the appropriate number shift for each panel, for example -10000, 20000, and 30 000, and thus to avoid conflict.

##### "Connection" Tab

Use the "Connection" tab to specify the connection settings between instances of the "Pandora network" handlers. 

Since the "Pandora network" handler uses a TCP/IP network as the communication channel, then to establish connection between the two handler instances, one of them shall act as a server, and the other as a client.

The role in which the handler will act when the connection is made is set by the "Connection initialization mode" parameter.

\imgcapt{img/Eventhandler-06-02.png}{"Parameters of group (Pandora network)" window, "Connection" tab, "Server" mode}

If the event handler acts as a server and several network adapters are used with the computer, or if one adapter uses several IP addresses, then using the "Interface address" parameter it is possible to specify the IP address on which the event handler shall wait for the incoming connection. The "Server port" parameter is used to specify the port to which the connection will be expected.

\imgcapt{img/Eventhandler-06-03.png}{"Parameters of group (Pandora network)" window, "Connection" tab, "Client" mode}

If the event handler acts as a client, it is necessary to specify the server address and port to which it is necessary to establish a connection.

It shall be noted that for the "Pandora network" event handler acting as a client, it is possible to specify several server addresses: in the event if it is not possible to establish a connection with the first address in the list, the handler will attempt to connect to the next one and so on.

To add the server address and port to the list, it is necessary to specify them as values for the "Server address" and "Port" parameters and click on the "Add" button.

To remove the server, it is necessary to select it in the server list and click on the "Delete" button.

To monitor the presence of a connection in the absence of information for transmission, the "Pandora network" handler can generate test packets and monitor their reception. In doing so, the test packages are created by the handler, acting as a server, and their reception is monitored by the handler, acting as a client.

The "Activity timeout" parameter is intended for controlling the period of connection monitoring in the absence of information for transmission. If the handler acts as a server, this parameter specifies the interval with which the handler forms the test packet. If the handler acts as a client, the "Activity timeout" parameter specifies the interval during which any packet, including a test packet, shall be received from the server. If there are no packets from the server during the interval specified in the "Activity timeout" parameter, the handler that acts as a client closes the connection.

When configuring the "Pandora network" event handler, it is necessary to select the value for the "Activity timeout" parameter based on the bandwidth of the communication channel and its operation cost. In general, for a handler acting as a client, it is recommended to set the value of the "Activity timeout" parameter approximately two and a half times more than for the handler acting as a server. As for the value of the "Activity timeout" parameter for the handler acting as a server, the recommended value for it shall be within the range of 30-300 seconds.

When connection is established via a communication channel, the "Pandora network" event handler creates a system event with the "ZZYC" code. If connection is lost, a system event with the "ZZYB" code is created. If the value of the "Connection restore timeout" parameter is not equal to zero, then in case of long-term absence of connection, system events with the "ZZYB" code will be created with the period specified by this parameter value.

##### "Parameters" Tab

Use "Parameters" tab to set the parameters to control reception and transmission of information via communication channel.

\imgcapt{img/Eventhandler-06-04.png}{"Parameters of group (Pandora network)" window, "Parameters" tab}

If the "Enable Pandora compatibility mode" parameter is selected, then the event handler will use an outdated protocol compatible with the "Pandora" and "Andromeda - Remote Operator" software for the information exchange. This protocol has a number of shortcomings, in particular, it does not guarantee the delivery of information to the recipient. It is strongly recommended not to enable the compatibility mode with "Pandora" when establishing a communication channel between two "Pandora network" handlers.

Use the "Ignore received event descriptions" parameter to control the reception of event descriptions. If this parameter is not selected, decoding is not performed for the events received via the communication channel: event class, part and zone numbers, and description are stored as received. If this parameter is selected, then only the channel and code will be taken from the received event, after which it will be decoded according to the event template set for the site as if it were received from a local event source.

The "Ignore received site descriptions" parameter allows to disable reception via the communication channel and storing in the database of site cards. If this parameter is selected, the site descriptions, that are sent along with the events, as well as their changes on the remote instance of the Security Center, are ignored. If this parameter is not selected, the descriptions of sites, information about which is transmitted via the communication channel, will be synchronized.

If the "Enable Pandora compatibility mode" parameter is not selected, then the "Pandora network" handler guarantees the delivery of information to the recipient. This is achieved with the help of confirmations that are sent from the recipient after the information it has received is registered in the Security Center database. Use the "Delivery confirm interval" parameter to specify the time during which the "Pandora network" handler waits for confirmation from the recipient. If no confirmation is received during the specified interval, then the "Pandora network" handler will send the information, which is not confirmed, again.

The value of the "Delivery confirm interval" parameter depends on the bandwidth of the communication channel used by the "Pandora network" handler and the performance of the computers on which the "Event manager" module is running. For example, if GPRS is used as the communication channel, in order to avoid an avalanche increase in the amount of information in the transmission queue, it is recommended to increase the value of the "Delivery confirm interval" parameter to 90 seconds.

If there is no connection, the "Pandora network" handler accumulates the information in the transmission queue, and after the connection is restored it transfers the information accumulated in the queue. Use the "Data store interval" parameter to control the volume and relevance of the data that are accumulated in the transmission queue. If the period of data storage in the transmission queue is greater than the value of this parameter, then such data will be automatically deleted from the transmission queue. Besides, if the bandwidth of the communication channel has deteriorated and there are data in the queue that cannot be transmitted, click on the "Clear transmitting queue" button to forcefully delete all data accumulated in the queue for transmission at the moment.

Check "Enable exchange logging" parameter to save the exchange protocol of the event handler via TCP/IP network to the computer hard disk. This information is useful when finding out the causes of problems when setting up a connection or sending information via the communication channel. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

#### "Event Classes" Tab

Use the "Event classes" tab to select event classes to be transmitted by the handler.

\imgcapt{img/Eventhandler-06-05.png}{"Parameters of handler (LAN repeater)" window, "Event classes" tab}

To select the event class for transmission, check it in the list. Use the "Select All" button to check all event classes in the list. Use the "Deselect" button to deselect all classes in the list that are currently selected for transmission.

#### "User actions" Tab

Use the "User actions" tab to select the operator actions and cancel the alarms that will be transmitted by the handler. It shall be noted that the actions and cancels that are transmitted by the handler shall relate to those alarms which classes are checked on the "Event classes" tab.

\imgcapt{img/Eventhandler-06-06.png}{"Parameters of handler (LAN repeater)" window, "User actions" tab}

To select the action or cancel for transmission, check them in the list.

### Repeater to Cloud

This event handler is intended to transmit information about the Security Center, sites, received events, guards and operator actions, engineers and their permissions, as well as about the video routers installed on the site, to the "Cloud". The "Cloud" is a service that allows to provide web-access to sites and events for owners, installation organizations, operators, and guards.

The "Repeater to Cloud" handler provides operation of such additional services as Call-center, partner's web-interface, Personal account, remote control of the site equipment, "Alarm to Guard" application, situational chart and some others. In more detail, all these services are described in the "Cloud Services" section.

The operation of this handler is important for the proper functioning of all cloud services, that is why editing it is very limited. The "Repeater to Cloud" event handler group and the handler in it are created during the first start of the "Event manager" module and are enabled automatically if the "Cloud Communication" dialog box indicates the need to use cloud services. 

Deletion, copying or creating another "Repeater to Cloud" handler is prohibited. It is necessary to change the parameters of connection to the "Cloud" only if "Private Cloud" is used.

#### "Common" Tab

General settings of the "Repeater to Cloud" event handler group completely coincide with the general settings of the event handler groups, which are discussed in detail above. When a group is created, it is automatically set to "Hidden group".

\imgcapt{img/Eventhandler-07-01.png}{"Parameters of handler (Repeater to Cloud)" window, "Common" tab}

#### "Channel" tab

The "Channel" tab displays the server address and port, which are used for connection to the "Cloud". To connect to the "Cloud" use the following settings: server address - disp.cnord.net, server port - 1025. It is necessary to change the parameters only if "Private Cloud" is used.

Check "Enable exchange logging" parameter to save the exchange protocol of the event handler to the computer hard disk. This information is useful when finding out the causes of problems when setting up a connection or sending information. It is not recommended to include the exchange logging independently, without a request from the technical support service of C.Nord.

\imgcapt{img/Eventhandler-07-02.png}{"Parameters of handler (Repeater to Cloud)" window, "Channel" tab}

If the user wants to avoid sending unnecessary information to the "Cloud", the user can choose the cloud services that he/she will use, and also ensure that only the information necessary for the selected services is sent to the "Cloud".

To limit the information transmission to the "Cloud" select "Connection to the Cloud" in the Event Manager. 

## Connection to the Cloud

When "Connection to the Cloud" option is selected, the drop-down menu of the same name appears in the "Event Manager". 

The "Cloud" icon appears in the status bar of the window. The icon color changes depending on the success of the connection to the Cloud and number of messages in the transmission queue. If the connection to the Cloud is established and the number of messages in the transmission queue does not exceed 100, the Cloud will be green. Otherwise - red. 

Besides, the status of the connection to the Cloud is displayed in the "Communication with the Cloud" line, and the number of messages in the transmission queue in the "Messages in the queue" line.

There are three tabs in the window "Connection to the Cloud": "Connection mode", "Contact Information", and "UID of Security Center".

### Connection mode {#event-manager-cloud-connection-mode}

Select one of the cloud connection modes on the "Connection mode" tab of the "Connection to the Cloud" window. The mode selection determines the cloud services that will be used and the data that will be transmitted to the Cloud.

\imgcapt{img/EvMan-07-CloudConnection.png}{"Connection to the Cloud" window, "Connection mode" tab}

Full integration with the Cloud allows to use remote access to site equipment, as well as available cloud services, for example, "Alarm to Guard." In this case, all data about sites, events and actions of operators will be transmitted to the "Cloud".

Connection to the Cloud can only be used for remote access to the site equipment. This connection mode allows to send only site numbers, communicator identifiers and permissions for engineers to access sites to the Cloud. Other Cloud services will be disabled and information on them will not be transmitted to the Cloud.

It is also possible to disable all cloud services and prohibit the transmission of any data to the Cloud. All services related to the use of the "Cloud" will be unavailable. The "Repeater to Cloud" event handler will be forcibly disabled and cannot be enabled. Access to the registration information and UID of Security Center will not be possible. 

It is also possible to use cloud services in the "Private Cloud", by selecting the appropriate connection. This provides an increased level of information security due to installation of the software directly on the servers of a private security company. It is possible to specify the address of the "Private Cloud" manager for the "Repeater to Cloud" handler group on the "Channel" tab of the "Parameters of group" window.

### Contact information

The "Contact information" tab allows to change the data specified when registering the Security Center in the Cloud. 

Use the tab to fill in such fields as "Surname", "Name", "Mobile phone", "E-mail", "Company name", "City" and "Street address". Fields marked with an asterisk are required. 

After changing the data, click the "Apply" button. In this case, the information entered will be transmitted to the Cloud.

\imgcapt{img/EvMan-07-CloudConnection-02.png}{"Connection to the Cloud" window, "Contact information" tab}

### UID of Security Center

It is possible to find out the UID of the used Security Center on the "UID of Security Center" tab. To copy UID select it and click on the "Copy" icon. This is convenient, for example, for the subsequent use of UID when registering a partner account.

\imgcapt{img/EvMan-07-CloudConnection-03.png}{"Connection to the Cloud" window, "UID of Security Center" tab}

If it is necessary to re-register the partner account, create a new UID. To do this, click on the "Create a new UID" button. Use the new UID to add this Security Center to another account or create a new partner account. It is allowed to create a new UID no more than once a day. 

## About software

When "About software" option is selected, the drop-down menu of the same name appears in the "Event Manager". It provides information on the version of the Security Center software, as well as information on the operation mode. The Security Center can be used with a security key, temporary license or on a lease basis.

\imgcapt{img/EvMan-08-AboutProgram.png}{"About software" window}

If the security key or license is used, the following is indicated in the "About software" window:

- the Security Center edition;

- maximum number of sites allowed to use;

- current number of sites maintained by the Security Center.

If the Security Center is used with a security key, information on the security key is also displayed in the "About software" window.

If the software is used with a license file, then information on the license is indicated here, as well as the date of its completion.

[id-04-20]: img/EventSource-11-02.png ""Event source Properties" window from BBCS Euro, "Number shift" tab"

[id-04-50]: img/EvMan-05.png ""Security Center registration in Cloud" window"

[id-04-51]: img/EvMan-06.png ""Security Center registration completion in Cloud" window"
