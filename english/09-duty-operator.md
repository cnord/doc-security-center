# Duty Operator

The "Duty operator" module is intended to monitor the operational status of the sites, view incoming events and record the operator's actions while handling alarms.

Before starting working in the "Duty operator" module, make sure that the "Event manager" module is running. If during the operation of the "Duty operator" module a connection error occurs with the "Event manager" module, a window with the error appears.

![Message of connection error with “Event manager” module][id-09-00]

To launch the “Duty operator" module, the user shall have the “Enter into the program" permission for this module.

Just like the rest of the Security Center modules, the "Duty operator" module downloads only those sites, the use of which is allowed on the computer on which it is running. It is possible to specify the intervals of site numbers that can be used on a particular network workplace in the "Personnel manager" module.

## Module Main Window

![Module main window][id-09-01]

The main window of the "Duty operator" module is divided into two parts. The upper part is intended for displaying sites, the lower one for displaying the received events.

## Quick Access Toolbar

The toolbar contains buttons that allow to access the most requested functions of the "Duty operator" module. In addition to the name of the function, a key or a combination of keys is given in parentheses to access the function from the keyboard.

!["Quick Access Toolbar”][id-09-05]

Click on the "Settings" button to open the settings window of the "Duty operator" module. In order for the user to make changes to the module settings, he/she shall have the "Change settings" permission for the "Duty operator" module.

Click on the "Operator..." button to change the operator registered in the "Duty operator" module. After the button is clicked, the operator registration window will be displayed in the module, the "Duty operator" module will not be stopped: the reception of events will continue, and when an alarm is received, the alarm handling window will be displayed.

Click on the "Card..." button to access the "Site card" window. The window of the current site will be displayed. The current site will be the site selected in the site list, or the site which event is selected in the event list, depending on the focused window.

Click on the "Events" button to activate the "Events from site" tab in the event window and to display the events from the current site in the list of events on this tab. The rules for selecting the current site will be the same as when clicking on the "Card..." button.

Click on the "Alarms..." button to access the "Alarm information" window. After the window is opened, the card of the current site and the handling log of the last alarm from this site will be loaded into it.

Click on the “Handling..." button to open the “Alarm handling" window. The button is active if the operator, who launched the module, has permission to “Handle alarms" or "Cancel alarm". Besides, the button is only available if the current site is an alarm site.

## Sites

At the top of the “Site status” window, the total number of sites loaded by the module, number of sites that are currently armed, and number of sites which alarm handling has not yet been completed, is given.
 
![“Site status” window, “All” tab][id-09-02-01]

Protected sites are displayed in the "Duty operator" module in the form of icons in the "Site status" window. The icon color displays the current status of the site. If it is blue, then the site is armed, green is disarmed, gray - the site is disabled. If one part of the icon is blue and the other is green, the site is partially armed. A red circle or square means that there is an alarm on the site, which has not yet been completed, while a red circle indicates that no action has been recorded for this alarm. 

It shall be remembered that alarms received from disabled sites are handled by the system automatically, immediately after reception. The arming and disarming events received from disabled sites also do not change their status. Thus, the disabled site cannot be alarming, armed, or disarmed. It is always displayed with a gray icon.

The site icons are displayed on tabs that group sites by basic states. The purpose of tabs is easy to guess by their names: 
- the "All" tab displays all sites that are allowed to be used in this workplace; 

- on the "Alarms" tab, the sites for which there are unhandled alarms are displayed;

- the “Partial armed" tab displays sites that were partially armed. In this case, not the whole site is protected, but only its particular zones;

- the “Armed" tab displays sites that are currently armed;

- the “Disarmed" tab displays sites that are currently disarmed, or sites which status is not defined, because they have never sent any events about arming or disarming.

To quickly find a site by number, use the field to search for a site in the upper right corner of the “Site status” window. Search for a site is carried out on the same tab that is currently active and is executed "on the fly", as the digits of the site number are entered in the search field.

### Tooltip {# duty-opertor-tooltip}

When you hover over a site in the "Site status" window, a tooltip appears, with which the Security Center operator can quickly obtain the information about the required site. The tooltip contains the following information:

- number, name and address of the site;

- status of the site or its parts (armed or disarmed);

- description of the alarm situation at the site;

- information about the guards called to the site. 

### Site Status

The tooltip contains information about the site status if at least one site is armed or disarmed.

![“Site status” window, tooltip, “Site status][id-09-02-01-01]

The tooltip indicates the time of the site arming or disarming if the event occurred within the last 24 hours, or the date if the event occurred earlier. The background color indicates the site current status: blue - the site is armed, green is disarmed. It shall be noted that when the "Show status color in reverse" parameter is selected, the colors that show the status of the protected sites are inverted. Besides, the tooltip informs about the user who completed the site arming or disarming.

If the site is divided into sections, the tooltip provides information about the status of each site part. In this case, the tooltip contains the following information: time of the last arming or disarming, part description, and the user who performed the operation. The last registered event is displayed in bold.

### Alarm

If an alarm situation is registered at the site, the tooltip contains information about the alarm. If several alarm events are registered at the site, the tooltip displays information about the first and last registered alarm.

![“Site status” window, tooltip, “Alarm”][id-09-02-01-02]

The tooltip indicates the time of the alarm if the event occurred within the last 24 hours, or the date if the event occurred earlier. The red background indicates an alarm situation at the site. 

If the site is divided into parts, the alarm parts are red.

### guards

The tooltip contains information about the Guard, if the Guard is called to the site ("Guard en route") or is present at the site ("Guard on site"). If the Guard call to the site is canceled, the call information is not displayed.

![“Site status” window, tooltip, “Guard”][id-09-02-01-03]

The tooltip indicates the time of the Guard call or arrival to the site, if the event occurred within the last 24 hours, or the date if the event occurred earlier. 

### Context Menu

When you right-click on the site icon, a context menu is displayed, with which you can quickly access information about the site.

![“Site status” window, context menu][id-09-02-02]

Selecting the "Site card..." menu item to access the window displaying the card fields of the selected site. The window appearance and its description are presented below, in the section "Site Card” Window”.

The "Alarms at the site..." item is intended for access to the window, displaying information about the alarms at the site, which handling is completed. In addition to the alarms themselves, this window displays the operator's alarm handling log. See more information about this window below, in section "Alarms" Window”.

Select the "Events at the site" menu item, to activate the "Site" tab at the bottom of the main window of the "Duty operator" module. The tab is intended to display events for a particular site and events from the selected site will be loaded into it.

Use the “Map of the site..." item to open the map file (graphic plan) of the site. If a graphic format file (BMP or JPG) is specified as the site map, it will be opened for viewing in the special window of the "Duty operator" module. If the site map is created with the help of the "Site maps" module, this module will be opened for viewing it.

The "Disable site" item in the context menu allows to temporarily disable any Security Center site, saving all information about the site in the system. This feature is convenient during routine maintenance or repair of equipment installed at the site.

The Security Center sites can be disabled by the operator with the corresponding permission. Select the "Disable site" item to view the “Site disabling" window, which contains information about the site number and name. Enter the time during which the site shall be disabled in the “Disable for" field of this window. After this time, the site will be enabled automatically. Enter the time in minutes, the maximum allowed value is 180 minutes. Specify the reason for the site temporary disabling in the "Reason for disconnection" field. This field is required. Before clicking on the "Disable site" button, study the warning that automatically alerts about the time when the site is disabled automatically (for example, "The site will be enabled automatically in 120 minutes, today at 22:16").

![“Site status” window, “Site disabling” window][id-09-02-07]

The event log displays information about the site disabling, namely: date and time of the site disabling; operator who performed disabling; time and reason for disabling.

The "Enable site" item allows to enable the previously disabled Security Center site before the expiration of the time specified during disabling.

![“Site status” window, context menu, “Enable site” item][id-09-02-08]

Select the “Enable site" item to view the “Site enabling" window, which contains information about the site number and name and time of the site automatic disabling. To enable the site, click the "Enable site" button of this window.

![“Site status” window, “Site enabling” window][id-09-02-09]

The event log displays information about the site enabling, namely: date and time of the site enabling; enabling mode (automatic or manual). If the site is manually enabled, the operator who performed the operation is specified for the event.

The "Disable channels" item in the context menu allows to temporarily disable any site channel, saving all information about the channel in the system. This function is convenient in case of a malfunction of the equipment used to for the communication channels.

The communication channel can be disabled by the operator, who has the right to "Disable channels for site". Select the "Disable channels" item to view the “Site channels disabling" window, which contains information about the site number and name. Select one or several communication channels for disabling in the "Channels that can be disabled” section: Radio, Phone, System, Ethernet, GPRS, SMS, and CSD. Enter the time during which the channels shall be disabled in the “Disable for" field of this window. After this time, the channels will be enabled automatically. Enter the time in minutes, the maximum allowed value is 180 minutes. Specify the reason for the channel temporary disabling in the "Reason for disconnection" field. This field is required. Before clicking on the "Disable channels" button, study the warning that automatically alerts about the time when the channels are disabled automatically (for example, "The channel will be enabled automatically in 120 minutes, today at 16:31").

![“Site status” window, “Site channels disabling” window][id-09-02-10]

The event log displays information about the channel disabling, namely: date and time of the channel disabling; channel name; period and reason for disabling.

The "Enable channels" item allows to enable the previously disabled channels before the expiration of the time specified during disabling.

![“Site status” window, context menu, “Site channels enabling” item][id-09-02-11]

Select the “Enable channels" item to view the “Site channels enabling" window, which contains information about the site number and name. Select one or several communication channels for enabling in the “Channels that can be disabled” section and click on the “Enable channels” button:

![“Site status” window, “Site channels enabling” window][id-09-02-12]

The event log displays information about the channel enabling, namely: date and time of the channel enabling; enabling mode (automatic or manual). If the channel is manually enabled, the operator who performed the operation is specified for the event.

The "View" item is intended to change the way the list of sites is displayed.

![“Site status” window, context menu, “View” item][id-09-02-03]

“Large icons", "Small icons", "List" items differ only in the size of the site icon and the way items are scrolled in the window. As for the "Table" item, if it is selected in the "Site status" window, a list of sites similar to the list of sites used in the "Site manager" module will be displayed.

![“Site status” window, “All” tab, “Table” view][id-09-02-06]

A detailed description of functions of such list of sites is given in the chapter devoted to the "Site manager" module. It shall be noted here that this list of sites allows to search for a site using the majority of significant fields, and not only by number, and in addition, the operator can see the fields of the site necessary to him/her without opening a separate window with the site card.

The “Arrange icons" context menu item is intended to change the way the icons of the sites are sorted when displayed.

![“Site status” window, context menu, “Arrange icons” item][id-09-02-04]

If you select sorting by site number, the site icons in the list will be displayed in ascending order of the site numbers. If you select sorting by site status, the site status will be taken into account in the first instance. 

In this case, first, sites will be displayed for which there are undefined alarms, and the first ones in the list will be those sites which alarm handling has not yet begun. After the alarm sites, sites that are armed will be displayed. The most recently disarmed and disabled sites will be displayed in the list as last, as well as sites which state is not defined.

It shall be noted that the item highlighted in the context menu in bold is the default item and will be executed in case of double clicking on the site with the left mouse button. If there are no undefined alarms for the selected site, then the item "Site card..." is the default item. If the alarm site is selected, then the default item is "Alarm handling...", after it is selected a window intended for the site alarm handling is opened:

![“Site status” window, context menu, “Enable site” item][id-09-02-05]

## Events

At the bottom of the main window of the "Duty operator" module, the received events and the status of the guards are displayed. 

Events are divided into three categories, each of which is displayed on a separate tab.

### All

![“Events” window, “All” tab][id-09-03-01]

The "All" tab displays all the significant events received from the sites loaded by the "Duty operator" module. In order to clarify what events are considered significant, it shall be mentioned that a filtering mechanism for test and duplicate events, which allows the operator of the Security Center to be released from handling information that does not matter to him/her, has been implemented in the Security Center software. The event filtering mechanism is controlled with the settings in the "Event manager" module. See the chapter devoted to this module to get acquainted with the details of this mechanism. Here it shall be mentioned that events that the significant events are those, that are not test or repeated, and only they are displayed on the "All" tab.
If the duty operator for some reason needs to see all events received from a particular site, then he/she can do it using the “Events from site” tab, which is described below.

The following information is displayed in the columns of the table of the "Events" window:

* "Channel" - type and number of the channel via which the event is accepted. The value of this parameter is determined by the event source with which the event was received. See more information about existing sources of events and their settings in the chapter on the module in the section "Event sources".

* "Date", "Time" - date and time of the event reception by the monitoring station equipment. If the information transmitted by the receiving equipment of the monitoring station does not contain the date and time of the event reception, then this column will display the date and time of recording the event in the database of the Security Center software.

* "Code", "Event class", “Part", “Z/U", “Event description" are the parameters obtained as a result of decoding of the received event in accordance with the site description. See more details about the parameters in the chapters on the "System setup" and "Site manager" modules, in the sections that describe the event templates.

* "Number", "Name", "Address" are the fields of the same name of the site card from which the event was received.

Events in the list can be sorted by any of the displayed columns. To do this, left-click on the necessary column.

When you right-click on the event, a context menu is displayed, with which you can quickly access information about the site. 

!["Events" window, context menu][id-09-03-05]

The purpose of the menu items is completely similar to that in the context menu displayed when clicking on the site icon in the "Site status" window.

### Alarms

!["Events" window, “Alarms" tab][id-09-03-02]

The “Alarms” tab displays alarm events that have not yet been completed. 

### Events at the Site

!["Events" window, "Events at the site" tab][id-09-03-03]

The “Events at the site” tab displays a summary of the selected site, as well as the events received from it. 

To change a site, which events are displayed on the “Events at the site” tab, enter its number in the "Change site" field and press the "Enter" key or the arrow button.

Use the "Show tests" parameter to enable or disable display of filtered test events received from the site. Similarly, use the "Show duplicates" parameter to enable or disable display of filtered duplicate events received from the site.

Right-click on the event to display the context menu, with which you can temporarily disable the event.

Events can be disabled by the operator with "Disable event codes” permission. If you select the "Disable event" option, a dialog box with information about the number, name and address of the site appears. Besides, the following is indicated: event code; event class; number of the part in which the event occurred; number of the zone in which the event occurred; description of the event. 

!["Events" window, context menu, "Disable event" item][id-09-03-03-01]

Enter the time during which the event shall be disabled in the “Disable for" field of this window. After this time, the event will be enabled automatically. Enter the time in minutes, the maximum allowed value is 90 minutes. Specify the reason for the event temporary disabling in the "Reason for disconnection" field. This field is required. Before clicking on the "Disable event" button, study the warning that automatically alerts about the time when the event is disabled automatically (for example, "The event will be enabled automatically in 45 minutes, today at 21:51").

!["Events" window, "Disable event" window][d-09-03-03-02]

The event log displays information about the event disabling, namely: date and time of the event disabling; event code; part and zone numbers, period and reason for disabling.

The "Enable event" item in the context menu allows to enable a previously disabled event before the expiration of the period, specified for disabling.

!["Events" window, context menu, "Enable event” item][d-09-03-03-03]

If you select the “Enable event" item, a dialog box with information about the number and name of the site appears. Besides, the following is indicated: event code; event class; number of the part; number of the zone; description of the event. The window also indicates the time of the event automatic enabling. To enable the event, click on the "Enable event" button of this window.

!["Events" window, "Enable event" window][id-09-03-03-04]

The event log displays information about the event enabling, namely: date and time of the event enabling; event code; part and zone numbers; enabling mode (automatic or manual). If the event is manually enabled, the operator who performed the operation is specified for the event.

### Status of guards

!["Events" tab, “Guard" tab][id-09-03-04]

The “Guards" tab displays the guards used by the Security Center. In addition to the general information about the guards on the tab, their current status is displayed ("Free", “Travelling to the site", “At the site"), and the name of the site to which the guard is called, if it is currently occupied.

## Alarm handling {#duty-opertor-process-alarm}

The window is intended to handle an alarm by the operator, who has “Handle alarm” permission. Alarm handling means recording the actions performed by the operator in the alarm log. This log is maintained in the "Duty operator" module, information from it can be printed in the "Report manager" module.

When the alarm event is received, the “Alarm handling” window opens automatically. This feature can be disabled in the settings of the "Duty operator" module. If you need to re-open the "Alarm handling" window, double-click on the alarm site or alarm event that you need to handle. 

When handling an alarm, it is important to understand that if another alarm is received from the site during the alarm process, both these alarms will be combined into a group and then they will be handled together. In the same way, these events will be displayed together when viewing handled alarms and when creating alarm reports in the "Report manager" module.

![“Alarm handling” window][id-09-08-01]

At the top of the “Alarm handling” window, all site alarms, which shall be handled, are displayed. 

In the middle part of the window there is a site card, on different tabs of which information about the site is displayed. The purpose of the displayed site fields is discussed in detail in the chapter devoted to the "Site manager" module.

The link "Video at site’s place" allows the operator to view the video transmitted by the cameras installed on the site. When the link is clicked, a window opens, where live video is displayed from all cameras installed on the site connected to the video router.

> To view video from the cameras, you shall have Adobe Flash Player installed on the computer with the latest available version that can be downloaded from the [official Adobe website] (http://get.adobe.com/flashplayer/otherversions/).

A list of actions, that the operator can perform during an alarm handling, is located to the right of the site card. This list includes the actions that are assigned to the classes of the events that shall be handled. Thus, for different alarms, the operator sees various possible actions, which allows to help and manage the operator's work.

The first ten actions in the list can be registered using the numeric keys on the keyboard as shortcut keys. If necessary, instead of pressing a single number key, it is possible to press it in combination with the "Alt" key. The option with which it is possible to enable or disable the use of the "Alt" key for quick access to actions is in the program settings.

See more information on how to create possible actions during alarm handling, as well as how to assign actions to event classes, in the chapter devoted to the "System setup" module.

### Call a Guard to the Site

When registering an action with the "Call a guard” type, a window is displayed in which the operator shall select the guard that he/she called on the site.

!["Call a guard to the site” window][id-09-08-02]

To register a guard call, check it in the list of guards and press the "OK" button. 
It is possible to check a guard in the list in two ways: by left-clicking the check box to the left of the group name, or by double-clicking the left mouse button anywhere on the line, in which the guard name and its senior are displayed.

If the operator registers the guard's arrival to the site or the cancellation of the guard call, the same window is displayed, but only the guards that were called to the site will be displayed in the list.

It is possible to change the list of guards in the "Personnel manager" module. See more information on how to do this in the chapter devoted to this module.

### Operator’s comment

If the operator registers an action with the type “Operator’s comment", then the text of the comment can be entered in a special window.

![“Operator’s comment” window][id-09-08-03]

The maximum length of the operator's comment is limited to four thousand characters. 

To finish entering the comment from the keyboard, click on the "Enter" button. To enter a new line when entering a comment, press the key combination "Control” + "Enter".

### Alarm Cancellation

If the alarm handling is completed and the operator shall register this, then he/she shall press the "Cancel the alarm (F8)" button. The alarm can be canceled by the Security Center operator with the corresponding permission.

The operator can select the brief result of the alarm handling or cause for canceling it in the “Alarm cancellation" window.

![“Alarm cancellation" window][id-09-08-04]

Reasons for alarm cancellation, displayed in the list, are assigned to the alarm event classes, for which the alarm cancellation is registered.

Also, as in the list of possible actions, the first ten reasons for alarm cancellation can be selected with the help of numeric keys or their combination with the "Alt" button.

To analyze the causes of alarms and make decisions intended to optimize the work of the monitoring station personnel, it is recommended to maintain a list of possible cancellations of alarms in the current state for each type of alarm. Besides, for the reliability of the analysis, the operator shall correctly register the actual reasons for canceling alarms. An instruction for the operator, which includes typical alarms and situations that lead to them, recommended scheme for handling typical alarms and an explicit indication of the reason for canceling the alarm, which the operator shall register in each case, is extremely useful for the analysis reliability, especially at first.

## Site Card

The "Site card" window is intended for access to information about the site. To open it, double-click on the icon of a site that is not alarming, or right-click on the icon of any site and select the "Site card...” item in the menu, that appears.

Besides, the site card can also be opened from the menu that appears when you right-click on any events from the site. Double-clicking the left mouse button on any event that is not alarming will result in a similar result.

![“Site card” window][id-09-06]

All information about the site that the duty operator may need is displayed on the tabs of the "Site card" window.. The purpose of the displayed site fields is discussed in detail in the chapter devoted to the "Site manager" module.

## Information about Alarms

The “Information about alarms” window allows the operator to view the log of handling alarms, which were canceled.

![“Information about alarms” window][id-09-09]

Switch of information display mode when moving to the next or previous alarm is located in the upper part of the window. In the "All alarms" mode, if you press "<< Previous" or "Next >>" button, the program will switch to the previous or next alarm in chronological order. In the “Alarms for the site" mode, the program will switch to the alarms for the site that is displayed in the window.

The list of alarms, for which the log is displayed, is located below the information display switch. See more information about assigning fields in the alarm list above, in the section on the “Event list” window.

The site card is displayed below the list, in the middle of the screen. The purpose of the displayed site fields is discussed in detail in the chapter devoted to the "Site manager" module.

The list of actions registered by the operator during alarm handling is displayed at the bottom of the screen. The list is displayed in chronological order and includes the actions registered by all operators who participated in the alarm handling.

## Module Setup

Access to the settings of the "Duty operator" module is regulated by rights that can be set in the "Personnel manager" module. Besides, that it is possible to limit an operator access to the module settings, it is also possible to prohibit the operator from closing the "Duty operator" module. These restrictions can be useful not only for inexperienced operators, but also for all duty operators, since accidentally closing the module or blocking the main window of the module with the settings window can negatively affect the process of alarm handling.

### Common

![“Setup" window, "Common" tab][id-09-07-01]

The "Pause at the start" parameter sets a pause, during which the "Duty operator" module will be delayed at the start. The parameter can be useful, if the icons of the "Event manager" and "Duty operator" modules are located in the "Startup" folder or if they are downloaded automatically at the start of the operating system in another way. To start the "Duty operator" module, the running "Event manager" module is needed, and it may take some time to start and fully initialize the module. 

If the value for the “Scrolling to the new event" parameter is set, then when you receive new events from sites, the list of events in the "All events" window will automatically scroll so that the new event is visible.

The “Conversely display status colors" parameter allows to invert the colors of the icons, representing the protected site status. By default, the Security Center site that is armed is blue and the disarmed site is green. If before the work with the Security Center the operator used the software for protection and monitoring of sites with the settings inverse to the proposed ones, he/she can apply this parameter. In this case, the site icons will be displayed in the colors inverted to the original ones: the armed site will be green, and the disarmed site will be blue. To apply the "Conversely display status colors" parameter, reload the "Duty operator" module.

It is possible to adjust the total number of events displayed in the "Duty operator" module using the “Date" parameter. It shall be remembered that the longer the interval of events is set, the longer the "Duty operator" module will be initialized and the more the requirements of this module will be to the resources of the computer.

With the " Interval of event reception indication" parameter the operator can continuously monitor the software operation, which is necessary for the timely detection of its malfunction. This parameter provides reliable control of the Security Center operator, including the "Duty operator" module, with the help of the sound indication of event reception. In order for the operator to be confident in the stable functioning of the system, event reception not subject to filtration is accompanied by a sound signal. If there are no unfiltered events during the time interval set by the parameter, the sound signal is accompanied by the reception of the filtered event. This event is displayed in the line of the last received event, but there is no information about it in the general list of received events, either in the list of alarm events or in the list of events for the site (to display the filtered event in the list of events for site enable “Show duplicates” mode). Besides, the received filtered event is not displayed in the site card or in the alarm handling window. To enable the display, set the " Interval of event reception indication" parameter to a value greater than zero. If this parameter is set to zero, the event reception indication is disabled. The default display interval is 30 seconds.

The maximum time for disabling events is set in minutes using the parameter "Maximum interval of alarms disabling". By default, time of event disabling shall not exceed 90 minutes. 

The maximum time for disabling the Security Center sites is set in minutes using the "Maximum interval of site disabling" parameter. By default, time of site disabling shall not exceed 180 minutes.

### Alarm Handling

![“Setup" window, “Alarm handling" tab][id-09-07-02]

If, when receiving a new alarm event, it is necessary for the "Duty operator" module to attract the attention of the operator, it is necessary to set the value for the “Activation at alarm” parameter.

In a situation where there is an alarm in the "Duty operator" module, for which no actions are registered for too long, the parameter "Repeat the alarm sound at the interval of" may be useful. If this parameter is set to a non-zero value, then if there are no alarm actions during the specified time, the "Duty Operator" behaves as if this alarm had just been received: it will again play the alarm sound and open the alarm window if this is enabled by the "Automatic opening” parameter in the alarm handling window.

The checked "Automatic opening" item of the "Alarm handling" window allows the alarm window to be opened automatically in case of alarm. The "Automatic closing" and "Automatic transfer to the next alarm" parameters determine the behavior of the alarm handling window, at the moment when the current alarm handling is completed. If the value of the first parameter is set, the alarm handling window will be closed. If a value for the second parameter is set, the next received alarm will be loaded into the alarm handling window. If values for both parameters are set, then the next alarm will be attempted first, and if it is not, the alarm handling window will be closed.

### Hot Keys

![“Setup” window, “Hot keys” tab][id-09-07-03]

Use the “Hot keys” tab to assign keyboard shortcuts for quick access to the main functions of the "Duty operator" module.

It shall be noted that hot keys for actions and cancellations are assigned automatically, when their list is formed. But with the "Not to use Alt at actions and cancellations” parameter it is possible to prohibit the combination of "Alt + Digit" for fast registration of actions or cancellations and use only digits.

The "Add hot keys to titles" parameter allows to display the hot keys assigned to operations in the button titles. 

### Dialing

![“Setup" window, “Dialing" tab][id-09-07-04]

If there is a modem or any device that supports dialing via TAPI interface connected to the computer, it is possible to specify the list of devices that the "Duty operator" module can use to dial on the “Dialing” tab.

To start dialing, left-click on any phone number of the site that is displayed in the site card.

If the dialed number is busy, the "Duty operator" module can dial it again if the value for "Repeat dialing, if the line is busy" is set.

### Security Center - Persona

![“Setup" window, "Security center - Persona" tab][id-09-07-05]

The Security Center software can be used in conjunction with the "Andromeda Persona” software. In particular, it is possible to download a list of sites of the Security Center to the “Persona", after which they can be placed on the terrain map.

Besides, changes in the status of sites and guards can be transferred from the Security Center to “Persona” so that the “Persona” can automatically display alarm sites on the map and also display the status of guards that are called to sites.

On the "Andromeda Persona" tab, it is possible to enable the "Duty operator" module integration with the "Andromeda Persona" software, and also allow automatic display of alarm sites and the status of guards in the “Persona".

[id-09-00]: img/ShiftOp-Main-00.png "Message of connection error with “Event manager” module"
[id-09-01]: img/ShiftOp-Main-01.png "Module main window"
[id-09-02-01]: img/ShiftOp-Main-State-01.png "“Site status” window, “All” tab”"

[id-09-02-01-01]: img/ShiftOp-Main-Tooltip-01.png "“Site status” window, tooltip, “Site status"
[id-09-02-01-02]: img/ShiftOp-Main-Tooltip-02.png "“Site status” window, tooltip, “Alarm”"
[id-09-02-01-03]: img/ShiftOp-Main-Tooltip-03.png "“Site status” window, tooltip, “Guard”"

[id-09-02-02]: img/ShiftOp-Main-State-02.png "“Site status” window, context menu"
[id-09-02-03]: img/ShiftOp-Main-State-03.png "“Site status” window, context menu, “View” item"
[id-09-02-04]: img/ShiftOp-Main-State-04.png "“Site status” window, context menu, “Arrange icons” item"
[id-09-02-05]: img/ShiftOp-Main-State-05.png "“Site status” window, context menu, “Enable site” item"
[id-09-02-06]: img/ShiftOp-Main-State-06.png "“Site status” window, “All” tab, “Table” view"
[id-09-02-07]: img/ShiftOp-Main-State-07.png "“Site status” window, “Site disabling” window"
[id-09-02-08]: img/ShiftOp-Main-State-08.png "“Site status” window, context menu, “Enable site” item"
[id-09-02-09]: img/ShiftOp-Main-State-09.png "“Site status” window, “Site enabling” window"
[id-09-02-10]: img/ShiftOp-Main-State-10.png "“Site status” window, “Site channels disabling” window"
[id-09-02-11]: img/ShiftOp-Main-State-11.png "“Site status” window, context menu, “Site channels enabling” item"
[id-09-02-12]: img/ShiftOp-Main-State-12.png "“Site status” window, “Site channels enabling” window"

[id-09-03-01]: img/ShiftOp-Main-Event-01.png "“Events” window, “All” tab"
[id-09-03-02]: img/ShiftOp-Main-Event-02.png ""Events" window, “Alarms" tab"

[id-09-03-03]: img/ShiftOp-Main-Event-03.png ""Events" window, "Events at the site" tab"
[id-09-03-03-01]: img/ShiftOp-Main-Event-03-01.png ""Events" window, context menu, "Disable event" item"
[id-09-03-03-02]: img/ShiftOp-Main-Event-03-02.png ""Events" window, “Disable event” window"
[id-09-03-03-03]: img/ShiftOp-Main-Event-03-03.png ""Events" window, context menu, “Enable event" item"
[id-09-03-03-04]: img/ShiftOp-Main-Event-03-04.png ""Events" window, "Enable event" window"

[id-09-03-04]: img/ShiftOp-Main-Event-04.png ""Events" tab, “Guard" tab"
[id-09-03-05]: img/ShiftOp-Main-Event-05.png ""Events" window, context menu"
[id-09-03-06]: img/ShiftOp-Main-Event-06.png "Events" window, context menu of alarm site"

[id-09-04]: img/ShiftOp-Main-LastEvent.png “Line of last received event"

[id-09-05]: img/ShiftOp-Main-Toolbar-01.png "Quick Access Toolbar"

[id-09-06]: img/ShiftOp-ObjectCard-01.png "“Site card” window"

[id-09-07-01]: img/ShiftOp-Settings-01.png "“Setup" window, "Common" tab"
[id-09-07-02]: img/ShiftOp-Settings-02.png "“Setup" window, “Alarm handling" tab"
[id-09-07-03]: img/ShiftOp-Settings-03.png "“Setup” window, “Hot keys” tab"
[id-09-07-04]: img/ShiftOp-Settings-04.png "“Setup" window, “Dialing" tab"
[id-09-07-05]: img/ShiftOp-Settings-05.png "“Setup" window, "Security center - Persona" tab"

[id-09-08-01]: img/ShiftOp-Alarm-01.png "“Alarm handling” window"
[id-09-08-02]: img/ShiftOp-Alarm-02.png ""Call a guard to the site” window"
[id-09-08-03]: img/ShiftOp-Alarm-03.png "“Operator’s comment” window"
[id-09-08-04]: img/ShiftOp-Alarm-04.png "“Alarm cancellation" window"

[id-09-09]: img/ShiftOp-AlarmInfo-01.png "“Information about alarms” window"

[id-09-10]: img/ShiftOp-Browse-01.png “”Select site” window"
