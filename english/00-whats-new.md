# What's New

Version 5 of Security Center software has a number of novelties that allow the security company not only to increase the list of services provided to clients, but also to optimize the work of the operator and engineering services.

## Disabling of Sites, Communication Channels and Events

During maintenance or repair of equipment installed on the site, it is convenient to use operation of temporary disabling of the site. After specifying the time and reason for disabling, the duty operator can disable Security Center site so as not to be distracted by receiving and handling messages received from the site. After the expiration of the specified period, the site is turned on automatically, however, the operator can enable the site earlier.

For the period of maintenance or repair of equipment used to provide communication channels with the site, it is possible to disable the communication channels. After specifying the time and reason for disabling, the duty operator can disable one or several site communication channels so as not to be distracted by receiving and handling messages passing through them. Disabling of one or another communication channel do not hinder reception of messages through other site communication channels. After the expiration of the disabling period, the communication channels are turned on automatically, however, the operator can enable the communication channels earlier.

If deliberately false alarms of fire alarm systems occur on the site (due to equipment malfunction, technical vulnerability of the site, movement of animals, etc.), it is possible to use the operation of event temporary disabling. After specifying the time and reason for disabling, the duty operator can disable the site event so as not to be distracted by handling the alarm. After the expiration of the disabling period, the event is turned on automatically, however, the operator can enable the event earlier.

See details on how to disconnect a site, communication channel or event, in the chapter on the "Duty operator" module.

## Site Reclosing

When handling an alarm message received from a site, it may be necessary to reclose the site: to open, inspect and activate security system again after the alarm cause was eliminated. Security Center software provides an opportunity to automatically notify the persons responsible for the site about the need to reclose the sites, as well as about the refusal of the responsible person to reclose.

The responsible person is notified of the need to reclose the site, as well as the refusal of the responsible person to reclose with SMS messages. It is possible to inform the responsible person of this and other situations in the "Site manager" module on ["Responsible Persons"] tab (#site-manager-doorkeys).

<!-- Guard can notify the responsible person about the site reclosing using "Alarm to Guard" application, also it can be done by the Security Center operator. -->
The Security Center operator can notify the responsible person about the site reclosing using "Alarm to Guard" application.

In order for the Security Center operator to notify the responsible persons of the site reclosing, such types of actions as "Reclosing request" and "Reclosing failure" shall be allowed. The necessary settings can be set in the "System Settings" module on the "Actions" tab (#system-setup-actions).

Informing the responsible person about the site reclosing is performed with the help of the event handler "Site reclosing". This handler generates the text of messages corresponding to the type of action in the given format and sends SMS to the responsible persons. See information about the handler settings in the chapter devoted to the ["Event manager"] module (#event-manager-reclosig).

## Tooltip

The "Duty operator" module provides [tooltip](#duty-opertor-tooltip), which appears when hovering over the site. With the help of the tooltip, the Security Center operator can quickly obtain the required information about the site, namely: number, name and address of the site, state of the site or its sections (under protection or removed from protection), and information about the first and last alarm in case of alarm condition on the site. 

## Video confirmations

To reduce the likelihood of response to a false alarm, as well as to coordinate the actions of guards at the site, the operator can view live video from the cameras at the site during alarm handling. To do this, a *video router* shall be installed on the site. It is a special device that can broadcast video from the connected cameras to the Security Center software.

See information on how to add a video router installed on the site to the site card in the chapter on the description of the ["Site Manager"] module (#site-manager-videorouter) for information on how to add a video router installed on the site to the site card.

In the chapter about the ["Duty operator"] module (#duty-opertor-process-alarm), it is also said about how the operator can view live video from the site during alarm handling.

## Cloud Services

<!-- Some new features of the Security Center software of version 5 are implemented as cloud services: "Call Center", "Alarm to Guard" application, "Situational chart", "Remote programming interface", "Personal account", etc. A brief description of the features of these services is given below, and more details about working with them can be found in the chapter "[Cloud Services](#cloud-services-2)". -->

Some new features of the Security Center software of version 5 are implemented as cloud services: "Remote programming interface", Mobile Application "MyAlarm", etc. A brief description of the features of these services is given below, and more details about working with them can be found in the chapter "[Cloud Services](#cloud-services-2)".

<!-- ### Call Center

"[Call center](#cloud-services-call-center)" service allows the client of a private security company to obtain information about the current status of the site (under protection/removed from protection) and to check the panic button. Both services are provided in automatic mode, which allows to reduce the load on the Security Center operator.

"Call Center" service is set in the [partner interface](#cloud-services-settings) in the "Cloud". Also here it is possible to get statistics of the service usage.

Identification numbers ("PIN") for access of responsible persons to the services of the "Call Center" service can be set in the ["Site Manager"] module (#site-manager-doorkeys). -->

<!-- ### Alarm to Guard

"Alarm to Guard" application is intended for use by guards during alarm handling. The application shall be installed on a mobile device (smartphone or tablet). Android or iOS can be used as the operating system of the mobile device.

When the Security Center operator registers a call to Guard for the site, information about it is sent to "Alarm to Guard" application together with a detailed description of the site: name and address of the site, list of alarms registered for the site, and list of responsible persons and zones at the site. 

If the site is [located on map](#site-manager-put-to-map), then the site location is displayed on the terrain map in the "Alarm to Guard" application, and it is also possible to plot the optimal route to the site. Yandex.Maps is used as a supplier of cartography, so the quality of maps, as well as the possibilities for plotting the route and display of traffic jams correspond to the capabilities of the Yandex.Maps service in a particular region.

To ensure that the guards have graphic information about the site (floor plans, site photos, etc.), in the "Alarm to Guard" application it is possible to view the site images. It is possible to download the site images for transferring them to the "Alarm to Guard" application in the ["Site Manager"] module (#site-manager-images)).

Passwords for accessing the "Alarm to Guard" application are created in the [partner interface](#cloud-services-settings). -->

<!-- ### Situational Chart

["Situational chart"](#cloud-services-radar) service is intended for displaying information about the sites and location, and condition of the Guards on the terrain map.

In order for the sites to be displayed on the situational map, they shall be preliminarily [located on map](#site-manager-put-to-map) in the "Site manager" module.

And for displaying of the Guards on the situational map, the guards shall be equipped with mobile devices with installed "Alarm to Guard" application.

Links to the "Situation Chart" can be obtained from the [partner interface](#cloud-services-settings). -->

### Remote Programming Interface

"Remote programming interface" service is intended for remote control of equipment installed on the site.

To ensure remote access at the site, the control panel by C.Nord or PIMA Electronic Systems Ltd. shall be installed, and the GSM transmitter "TR-100 GSM III" shall be used as the communicator.

To gain access to the "Remote programming interface" service, it is necessary to [register](#personnel-manager-engineer) the engineer in the "Cloud", and also give him access to the [site management](#site-manager-service).  

<!-- ### Personal Account

The "Personal account" service is intended for clients of a private security company. With its help, they can access the site card and verify correctness of the key information in it, view the report on the taking the site under protection/removing it from protection, and view the identification codes of the responsible persons for accessing the "Call Center" service. 

Besides, if a video router is installed on the site, a private security company client can view live video from cameras installed on the site.

To give the client access to the "Personal account", the Security Center operator shall [register](#personnel-manager-myalarm-admin) him/her in the "Cloud" and assign him/her as [administrator](#site-manager-myalarm) for one or more sites.

Information about the private security company, which the administrator sees in the "Personal account" (name of the private security company, link to the site, phone and e-mail) can be specified in the [partner interface](#cloud-services-settings). -->

### Mobile Application "MyAlarm"

"MyAlarm" application are intended for clients of private security companies. With its help, it is possible to access the site card, information about its status, and also the list of responsible persons.

The application shall be installed on a mobile device (smartphone or tablet). Android or iOS can be used as the operating system of the mobile device.

The key feature of the "MyAlarm" application is the ability to take the site under protection or to remove the site from protection directly from the application. For this purpose, the control panel by C.Nord or PIMA Electronic Systems Ltd. shall be installed, and the GSM transmitter "TR-100 GSM III" shall be used as the communicator. The application user shall enter the user code that he/she enters on the control panel keypad, this code is translated to the control panel, after that the event of taking or removing is transferred to the "MyAlarm" application. Due to the fact that the events in the "MyAlarm" application are transmitted from the Security Center, after the taking under protection it is not necessary to monitor the signal passage to a private security company.

Ability to view the event log for the site is an important feature of the "MyAlarm" application. Besides, the event log of the "MyAlarm" application displays the actions that the Security Center operator makes during alarm handling.

The Security Center operator can [specify](#site-manager-myalarm) what events and operator actions will be displayed in the event log of the "MyAlarm" application.

It shall be noted that if a video router is installed on the site, in addition to video confirmations in the event log, it is possible to view live video from cameras installed on the site in the "MyAlarm" application. The video stream quality depends on the communication channel bandwidth, which is used for Internet access from the mobile device.

It is necessary to specify the same login and password, which are used to access the "Personal account" services, for authorization in the "MyAlarm" application.

### Site Access Control from "MyAlarm" Application

Version 5.3 of the Security Center had only one way to give the responsible person access to the site from the "MyAlarm" application - to assign the responsible person as the administrator of the personal account. 

In version 5.4 of the Security Center, a new opportunity appeared: to give access to the responsible persons specified in site card. More information on how to do this can be found in a [separate article](#myalarm-access).

### Operator Permissions during Alarm Handling

In version 5.2.855, new operator permissions related to alarm handling in the "Duty Operator" module have been added.

Suppose that the duty operators on the receiver are divided into two groups.

The task of the first group is to make a decision about whether the response requires a response (Guard call) or not. These operators shall be able to start the alarm handling immediately, once it is received. They monitor events from the site, call up the responsible persons, etc. And at some point they decide to cancel the alarm or to react. If it is decided to react, the operator registers the alarm confirmation.

Once the alarm is confirmed, operators from the second group, which task is the response, start their work. They "do not see" those alarms that are not confirmed: the event does not appear in the "Alarms" list, there is no alarm sound, the site does not become alarm. All this happens only at the moment when the alarm is confirmed: the alarm becomes "real", the reacting operators see it as if it has been just received and begin to react.

Confirm alarms
In order for the operator from the first group to confirm the alarm and transmit it to the operators of the second group, he/she shall have the permission "Confirm alarms".

Manage Guard
If the operator has the permission to "Manage Guard", then he/she has the opportunity to register actions with the type of "Guard Call", "Guard Arrival" and "Cancel Guard Call". 

If operators from the first group do not really control Guard, then they shall not have this permission. If the operator does not have a permission to manage Guard, then the Guard control actions do not appear in the list of possible actions for the alarm.

The operators of the second group, on the contrary, shall have such permission.

Since this is a new permission, when upgrading to version 5.2.855, all operators of the Security Center who had permission to process alarms will receive it.

Process only confirmed alarms / Cancel only confirmed alarms
These are permissions for the operators from the second group. If the operator has permissions only for handling of confirmed alarms, he/she will "see" the alarm only after it has been confirmed.
