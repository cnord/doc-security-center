# Site Manager

The "Site manager" module is intended to manage the description of sites available in the Security Center software.

To launch the "Site manager" module, the user shall have the "Log in" permission for this module.

\imgcapt{img/ObjMngr-01-Main.png}{Module main window}

The main window of the "Site manager" module displays a list of Security Center sites and a card of the current (selected) site. To perform any operation with the site, select the appropriate item in the menu. The most requested menu items are duplicated in the control panel of the module and control panels on the tabs on which the fields of the site card are grouped.

## Control Panel

\imgcapt{img/ObjMngr-02-Toolbar.png}{Control Panel}

The operations, which are controlled by buttons on the control panel (listed in the order of the buttons):

* Use the "Create site" button to create a new site. The newly created site is assigned the first free site number, which can be changed later.

* The "Copy site" button is intended to create a new site and copy all information from the current (selected) site to it, except for the site number and site number of parts, if any.

For the number of the created site and for the site number of parts, the first available numbers are used, which can be changed when the site is subsequently edited.

* After clicking on the "Edit site" button, the "Site manager" module will switch to the editing mode of the current site card. In the editing mode, it is possible to change the value of the site card fields.

While in the editing mode it is not allowed to select another site from the list of sites - it is necessary to finish editing beforehand, saving the changes made or discarding them.

To switch to the editing mode of the site card, the user shall have the "Edit sites" permission for the "Site manager" module. If this is not specified specifically, then this permission is sufficient to make changes to most fields of the site card.

* To delete a site use the button of the same name. When a site is deleted, all information associated with this site is deleted, including description of its parts, zones, responsible persons, etc.

If there is a possibility that the information about the site to be deleted may be needed, it is recommended that the site is not deleted, but instead it shall be changed to the number using a shift to the area of obviously unused site numbers. For example, if site 567 is no longer protected, but the information in the site card or reports on received events may still be needed, it is possible to change the number using the shift of 990000, that is, the new site number will be 990567. To hide such sites from the duty operator, it is possible to use the mechanism of dividing the numbers of sites on computers. See more information about setting up this mechanism, in the chapter on the module "Personnel manager", section "Computers".

* The "Save changes" button is only available in site editing mode. Press this button to save all changes to the site card that were made while editing, after which you will exit the editing mode.

* As well as the previous button, the "Undo changes" button is available only in site editing mode. Press this button to cancel all changes made during the site editing, after which you will exit from the editing mode.

* Click on the "Exit program" button to exit the "Site manager" module

## List of Sites

\imgcapt{img/ObjMngr-03-ObjectList.png}{List of sites}

The main purpose of the list of sites in the "Site manager" module is to find and select a site, information about which shall be viewed or changed.

Search for the site is done using the search bar at the top of the site list. Enter a substring in the input field, then click on the "Start" button to start the search from the beginning of the displayed list of sites. If it is necessary to continue the search, starting with the currently selected site, then click on the "Continue" button. If a site satisfying the search condition is found in the list, it will be selected - it will become the current one. The search for a given substring is performed in all frequently used fields of the site card, such as "Site number", "Site name", "Site address", etc.

### Selection of Displayed Columns

\imgcapt{img/ObjMngr-03-ObjectList-01.png}{List of sites: selection of displayed columns}

It shall be noted that it is possible to select the columns that shall be displayed in the list of sites. To do this, left-click on the special button located in the upper left corner of the list of sites and check the necessary columns in the list that appears.

### Sorting of Sites

Sites in the list can be sorted by any of the displayed columns. To do this, left-click on the necessary column. In the header of the column on which the sorting is performed, an icon is displayed, which is a sorting indication, also it specifies the sorting order - ascending or descending. If it is necessary to sort in the reverse order, click on the same column again.

It is possible to sort by several columns. To do this, click on the column header, sorting by which you want to add, and hold down the Control button on the keyboard at the same time.

### Filtering of Sites during Display

\imgcapt{img/ObjMngr-03-ObjectList-02.png}{List of sites: filtering button}

Another useful function of the list of sites is filtering by a given characteristic. For example, if it is necessary to display only sites of the "store" type, click on the arrow that appears in the column header when the mouse cursor appears over it and select the type of site in the drop-down list.

Or, for example, to make sure that only sites with the word "Dixie" are displayed in the list. To do this, click on the filtering settings arrow on the column and select the "Filter ..." item. In the window it is necessary to choose the comparison rule, let it be "equal", and enter the reference for comparison - "Dixie".

Special filtering flexibility is achieved due to the comparison rule "similar to". Using the rule it is possible to filter the list of sites, ignoring minor discrepancies in the values of fields: to do this, a special symbol "%" can be used in the reference value, indicating the comparison procedure, that instead of it any substring can appear, including an empty one.

\imgcapt{img/ObjMngr-03-ObjectList-03.png}{List of sites: filtering settings window}

The figure shows the result of filtering by comparison using the rule "similar to %id%".

\imgcapt{img/ObjMngr-03-ObjectList-04.png}{List of sites: result of filtering by comparing "similar to %ld%"}

## Restoring of Deleted Site

To see the card of the deleted site of the Security Center or generate a report on the events at the deleted site, use the function of restoring a deleted site.

To restore a deleted site, the Security Center operator, who has the appropriate permission, shall select "Restore deleted site..." of the "Site" item in the menu of the "Site manager" module.

\imgcapt{img/ObjMngr-22-ObjectRecovery.png}{Restore deleted site}

The "Select site to restore" window that opens displays the sites that were deleted earlier. For each of them, the number of sites (at the time of the first deletion of the site), name and address of the site, contract number, as well as date and time of deletion of the site are indicated in the corresponding fields. It is convenient to search the site to be restored using these parameters by sorting and filtering sites by a specified characteristic.

\imgcapt{img/ObjMngr-23-ObjectRecovery-01.png}{Select site to restore}

To restore, select the site in the "Select site to restore" window and click the "OK" button. After that, the site will be restored and displayed in the list of sites in the main window of the module.

In this case, the number of the restored site changes, if it coincides with the number of already existing site or part. The number change is achieved by adding certain symbols (from "A" to "F"): for example, the site number "314" is changed to "A314". In the same way, the number of any part of the restored site changes if it coincides with the number of already existing site or part. The number of the restored site and number of its parts are reported in a window that automatically opens immediately after the site is restored.

\imgcapt{img/ObjMngr-24-ObjectRecovery-02.png}{Information on number of restored site and its parts}

It shall be noted that for the computer on which the site is being restored, a restriction on the available site numbers can be set. If the number of the site to be restored exceeds the limits of this restriction, the site will be restored, but a message will appear informing the user about the need to change the site number or change the restriction on available site numbers.

For the site, such parameters as identifier of TP-100 GSM III transmitter, identifier and encryption key of the "Yupiter" device are not restored. For the site to be restored, the administrator of the site is also deleted in the personal account and subscriptions to event classes and operator actions are deleted, which were available in the "MyAlarm" application before the site deletion.  Besides, for the site to be restored, the permissions granted to engineers for remote access to this site are canceled.

It is important to remember that the necessary condition for site restoration is the ability to add a site to the Security Center database in accordance with the available license restrictions. If the maximum possible number of sites is created in the database, an error message is displayed and the procedure for restoring the site is terminated.

## Site

On the "Site" tab it is possible to specify the basic descriptive information about the site: number, name, address, phone numbers and so on.

\imgcapt{img/ObjMngr-04-Object.png}{"Site" tab}

### Site location on map {#object-manager-put-to-map}

To display the site on the situational map, it is necessary to specify the geographic coordinates of the site by placing it on the terrain map.

To do this, the Security Center operator shall have the permission to "Set on the map".

To locate the site click the "Set on the map..." button next to the "Address" field on the "Site" tab. It is not necessary to switch to editing mode to do this. The "Map" window, called by this action, displays "Google Maps". The marker marks the location of the site. The location is determined in accordance with the value of the "City" field specified when registering in the "Cloud" and the "Address" field specified on the "Site" tab. Besides, the window provides a brief information about the site, namely: number, name and address of the site, as well as a comment for the Guard, entered on the "Comment" tab.

By hovering the cursor over it and holding down the left mouse button, it is possible to move the marker to indicate a more accurate location of the site. To zoom in or out use the zoom slider. Move the map with the cursor. The drop-down list allows to change the default type of the map "Scheme" to "Satellite", "Hybrid", "Public map", "Public map + satellite".

\imgcapt{img/ObjMngr-04-PlaceObject-01.png}{"Site" tab: Set on the map}

After the marker is set, click the "Save" button to save the changes. The received site coordinates will be stored in the "Cloud" and in the Security Center database. After the coordinates are successfully saved, the "Delete from map" button will be active. Otherwise, it will be necessary to repeat the operation of setting the site on the map.

Important: setting sites on the map is possible when connecting to the Cloud and when ports 80 and 443 of the TCP protocol for the computer, on which the "Site manager" module is running, are open.

To delete the saved coordinates of the site from the map, click on the "Delete from card" button and confirm the deletion. In this case, information about the coordinates of the site will be deleted both from the Cloud and from the Security Center database.

If it is necessary to find out if the site is set on the map, see the information provided in the list of sites of the "Site manager" module in the "On the map" column. If this column is not displayed in the list, disable it. To do this, check the "On the map" column in the list of columns displayed in the list of sites by left-clicking on the special button located in the upper left corner of the list of sites.

### Site Map

It is possible to specify both BMP and JPG file formats, as well as site map files created with the "Site Maps" module as the value for the "Site map" field. The "Change..." button, located next to the "Site map" field, is available for clicking only if the site map file is specified: when it is clicked, the "Site map" module will be launched to change the site map.

When creating and saving site maps using the "Site Maps" module, it is necessary to take into account that copying of information from site map files to the Security Center database is not performed. The source files are used to display the maps. This is important when running the Security Center in the local network, since the map files in this case shall be stored on a network resource accessible to all network users of the Security Center at least for reading. Besides, when creating backup copies of the Security Center database, a backup copy of the site map files is not created: the user is asked to organize the backup of site map files independently.

See more information about creating site maps using the "Site Maps" module in the section devoted to this module.

### Web Link

Despite the name, in the field "Web-link" it is possible to specify *any* file and resource located on the local computer, in the local network or the Internet, which can be opened using the tools installed on the computer.

When clicking the "Link ..." button in the "Site manager" module, or the "Web link" field in the site card in the "Duty operator" module, the command for opening the specified resource will be executed by the means registered in the operating system on default for this type of resource.

For example, in the "Web link" field it is possible to specify the address (URL) of the web page where video streaming from the camera installed on the site is displayed. Click on the link to run the default browser, in which the specified page will be opened.

Similarly, in the field "Web link" it is possible to specify the path to the description file of the site created in a special format (AutoCad, 3D-Max). Click on the link to launch the program registered in the operating system to open such a file.

### Images of Site {#object-manager-images}

In the "Site manager" module, it is possible to download images of the selected site from the hard disk to the Cloud or delete it from the Cloud.

The "Alarm to Guard" application displays the images of the site stored in the Cloud from which the alarm signal arrived. Thanks to this, employees of security companies can obtain the necessary information about the type of the site and the most convenient entrances to it.

To load and delete images, the operator shall have the permission to "Edit image of site".

To work with images, it is necessary to click on the "Image of site ..." button, without switching to the site editing mode. Then the window of the same name is opened for downloading images, as well as for viewing and deleting already uploaded graphics files.

Important: it is possible to download images to the Cloud when connecting to the Cloud and when ports 80 and 443 of the TCP protocol for the computer, on which the "Site manager" module is running, are open.

Use the "Select" button in the "Files" address line to select one or more images of the site in PNG and JPEG formats for download. The image size shall not exceed 5 MB.

To quickly find them on the hard disk and correctly save in the Cloud, it is better to put the images of the site in the folder which name corresponds to the site number. It is also possible to assign the names, that start with the site number.

After selecting the graphic files, click the "Send" button. In this case, the image size will be automatically reduced to the optimal for displaying on the tablet in the "Alarm to Guard" mobile application. The progress bar in the "Progress" field displays the status of loading the selected images. Closing the "Image of site" window or selecting new graphic files for uploading is not possible until the download is complete.

\imgcapt{img/ObjMngr-04-ObjectImage-02.png}{"Site" tab: image of site}

Moving or removing of the graphic files, stored in the "Cloud", from the hard disk does not lead to their loss in the Cloud. To delete downloaded image from the Cloud, hover over its thumbnail in the "Image of site" window and click on the "Basket" icon that appears.

## Parts

The "Parts" tab allows to save information about which parts (areas) the site is divided into and what equipment is used to organize parts on the site.

\imgcapt{img/ObjMngr-05-Parts.png}{"Parts" tab}

In a number of cases, the term "Area" is used in the documentation for site devices instead of the term "Part". There is no meaningful difference between these terms, the term "Area" is used for historical reasons: once it was used in one of the translations of the documentation for site devices and since then it is often used as a synonym for the term "Part". Besides, the term "Key" is very common in Russian literature, which is also a synonym of the term "Part".

Sometimes the term "Area" is specially used to emphasize the difference in the method of encoding information transmitted from the site device. For example, the term "Part" is used for site devices transmitting information in the "Contact ID" protocol, which implies one site number for all parts of the device and individual sequence numbers for each part.

In turn, the term "Area" is used for devices transmitting information via the protocols of the "4/2" family (for example, "EPAF"), where there is no separate field for the part number, and to identify the parts it is possible to assign them individual site numbers.

The Security Center software supports any of these methods of identifying parts on the site. When describing parts it is possible to specify both the sequence number and the number of the site (key).

Use the "Add part" and "Delete part" buttons to add a new part to the list of site sections, or delete the selected part from the list.

The "Part" field shall be filled in if the parts in the site device have serial numbers and when sending messages from the site the "Contact ID" protocol is used. As the value for the "Part" field, the sequence number of the part programmed in the site device shall be used.

If there is no part number in the information received from the site, then the value of the "Part" field does not matter for Security Center and can be filled arbitrarily. When a new part is created, it is assigned a number following the maximum number assigned to the existing part.

The "Cust. number" field shall be filled in if individual site numbers are used to identify parts. The value for the "Cust. number" field shall be the site number programmed for the part in the site device.

If individual site numbers are not used to identify parts on the site, the value for the "Cust. number" field can be empty or can be filled with the number of the site to which the site belongs.

The "Channel" field is intended to perform identification of the site from which the event was received in combination with the value in the "Cust. number" field. For example, if you specify the site number in the "Cust. number" field that is different from the site number, and set "Radio" as the value for the "Channels" field, then the event received from the site with such a number over the radio will be treated as an event, received for this site.

Using such a description of parts for sites can be useful in cases when additional communicators (for example, radio transmitters) are installed on already equipped sites, but the numbers of the sites, on which they are installed, are already used in the radio channel. In this case, it is possible to program the panel so that different site numbers are used by telephone and radio, using these numbers and communication channel types when describing the parts of the site.

If the "Channel" field in the section settings is not used to identify the site, it is recommended to use the value "Any" as the value for this field.

In the "Description" field, it is possible to specify an arbitrary line describing the site part for the monitoring center employees. This can be a description of zones or rooms included in the part, or other features of the part organization.

If the Security Center software can identify the part on which the event was received, then the part description will be used to form a description of the events received from the site: the value specified in the "Description" field will be substituted in the description of the event instead of the macro %%part%%.

In the "Arm schedule" field of the "Parts" tab for each of the site parts there are links "Add" or "View". The "Add interval" link redirects to the "Arm schedule" tab, where the corresponding part for scheduling has already been selected. The "View" link is available when the arm schedule for the part has already been created. Click on the "View" link, to open the schedule created on the "Arm schedule" tab.

As a value for the "Equipment" field, it is possible to specify the type of site equipment that is used to organize the part. This feature is useful if several site devices are installed on the site.

The value for the "Equipment" field can be selected from the list. It is possible to change the contents of this list in the "System setup" module - on the "Site fields" tab, "Customer part equipment" field.

To save the changes made to the description fields of the parts, it is necessary to confirm them by pressing the "Enter" button after completing the entry of the values.

## Zones

On the tab "Zones", it is possible to describe in detail the protection coverages of the site, including information about the equipment used and distribution of zones in the site parts.

\imgcapt{img/ObjMngr-06-Zones.png}{"Zones" tab}

Information about zones is a very important part of the site description, since it is used when generating the description of events received from the site. For example, if an alert is received from the site in zone one, the event description, which will be created for handling by the Security Center operator, will be substituted for description of zone one from the site card.

Use the "Add zone" and "Delete zone" buttons to add a new zone to the site zone list, or delete the selected zone from the list.

The "Zone number" field is intended to indicate the number of the described zone. The value for this field shall be the sequence number of the zone programmed in the site device.

In the "Description" field, it is possible to specify an arbitrary line describing the site zone for the monitoring center employees. As a rule, the description contains a name of the room or the protection coverage, to which the zone belongs.

As a value for the "Equipment" field it is possible to specify the list of site equipment that is used to organize the zone.

The value for the "Equipment" field can be selected from the list. It is possible to change the contents of this list in the "System setup" module - on the "Site fields" tab, "Customer zone equipment" field.

As the value for the "Key" field it is possible to specify the part to which this zone belongs. If the site device is divided into several parts, then, by specifying parts in the description of the zones, we will get detailed information on the organization of the protection coverages at the site.

## Responsible Persons {#object-manager-doorkeys}

\imgcapt{img/ObjMngr-07-DoorKeys.png}{"Responsible persons" tab}

Use the "New" and "Delete" buttons to add a new or delete the selected person from the list.

Use the "Up" and "Down" buttons to change the order of the responsible persons in the list. The order of the responsible persons in the site card in the "Duty operator" module corresponds to the order that can be set on the "Responsible persons" tab.

Click on the "Edit" button in the main panel of the "Site manager" module on the "Responsible persons" tab to edit the field values of the site responsible person.

The "Number" field shall be filled in if the user, who has the personal code of the site arming/disarming, is indicated as the responsible person. In this case, the user number programmed in the site device shall be specified as the value of the "Number" field for the responsible person.

If the described responsible person does not own the personal code of the site arming/disarming, then an empty value can be used for the "Number" field.

In addition to the user number for the responsible person, it is possible to specify other necessary information: name, position, mobile and home phone numbers, address.

If the "Display in a private account" field has "Yes", the responsible person will be displayed in the list of responsible persons in the "Personal account" application.

Configure the automatic notification of the responsible person about the need to reclose the site using the "Reclosing" field. If the value is "Yes", the responsible person will receive SMS with information about the site that needs to be opened, inspected and taken under protection once the cause of the alarm has been eliminated.

In order for the responsible person to receive SMS with information about the person who refused to arrive for the site reclosing, it is necessary to set the value to "Yes" in the field "Reclosing failure".

In the field "PIN code", it is possible to change the PIN code of the responsible person for checking the panic button, as well as to confirm the site arming or disarming (when requesting PIN code). If prior to changing the PIN codes of all site responsible persons were the same, a window will appear asking if it is necessary to change the PIN code for all site responsible persons.

The "Commentary to responsible persons" field is intended to add additional information about the site responsible persons. If necessary, this field can be hidden.

If the responsible persons describe the users with the personal codes of arming/disarming, then information about the user, who performed arming or disarming, will be included in the description of the event handled by the Security Center operator.

## MyAlarm

The MyAlarm tab is required to control user access to the MyAlarm application.

When you enter the application, information about the site is not available until the user is logged into the Security Center and will not be granted access to it. 

To make the list of users appear on the "MyAlarm" tab, it is necessary to create it on the "Responsible persons" tab. It is necessary to mandatory specify the number, name and surname, as well as the mobile phone. In the absence of one of the values, the line with the user will not appear.

\imgcapt{img/MyAlarm_ResponsiblePerson.png}{List of responsible persons for Myalarm tab}

Users cannot get access to sites after invitation to the application. To open access, it is necessary to click on the "Allow access" button, then the application will display the site.

\imgcapt{img/MyAlarm_AllowAccess.png}{"Allow Access" button}

There are two types of access:

* User - sees the status of all partitions and receives notifications about changing their status;
* Site Administrator - sees the status of all partitions and receives notifications about changing their state, controls the site state.  Can invite other users to the MyAlarm application without the Security Center.

\imgcapt{img/MyAlarm_AccessTypes.png}{Access types in MyAlarm}

To restrict access, it is necessary to click the "Deny access" button. After that, the site in the application will not be displayed.

\imgcapt{img/MyAlarm_RestrictAccess_1.png}{"Deny Access" button}

** “Enable panic button" **. Displays a virtual panic button in MyAlarm, which can be used for emergency call to a site. It works like a real panic button, but it is in the smartphone, which allows to call help regardless of the user's location. A security company can control access to the button for each user via the Security Center.

\imgcapt{img/MyAlarm_AllowPanicButton.png}{"Allow Panic Button" button}

To remove the panic button from the application, it is necessary to click on the “Disable panic button" button.

\imgcapt{img/MyAlarm_RestrictPanicButton_1.png}{"Disable panic button" button}

**"Synchronize with Cloud"**. Using the button "Synchronize with Cloud", it is possible to request the MyAlarm user list from the Cloud and synchronize it with the list of users of the site. The button works only if there is at least one user on the MyAlarm tab.

\imgcapt{img/MyAlarm_CloudSync.png}{"Synchronize with Cloud" button}

## Arm

On the "Arm" tab it is possible to change the parameters associated with the site protection rules and protection.

\imgcapt{img/ObjMngr-08-Arming.png}{"Arm" tab}

### Long-term arm

The field "Put under long-term arm" is intended for enabling long-term protection mode of a site and indication of the mode duration. The long-term protection is intended to control situations when the site for some reason shall be under protection for a long time.

The site long-term protection is monitored as follows:

* at the start of long-term protection, the fact of the site arming is checked;

* if the site is not armed, a system event with the "ZZXC" code is created. If the site continues to be not armed, the system event with the "ZZXC" code will be repeated with the interval specified by the value of the "Arm schedule alarm periodicity" parameter specified in the settings of the "Event manager" module;

* if during the interval specified as the long-term protection time, the site will be disarmed, a system event with the "ZZXE" code will be created, after which the monitoring cycle of the long-term protection will begin anew - with the generation of the system event with the "ZZXC" code and expectation of the site arming.

To change the site long-term protection parameters, the user shall have the "Edit long-term arm" permission for the "Site manager" module.

### Site Disabling

The "Disable site" field is intended to disable the site, starting from a certain time. If the site is disabled, the events received from it are handled as follows:

* when receiving any events from the site in the "Duty operator" module, the sound is turned off. That is, all events continue to be displayed, events with types of "Arming" and "Disarming" classes continue to change the state of the site, but there is no sound when receiving events from this site;

* when receiving events with the type of the "Alarm" class, they are automatically canceled. In other words, if the site is disabled and an alarm comes from it, in addition to the fact that there is no alarm sound, this alarm is also automatically canceled.

If the site is disabled, the "Automatically enable the site" parameter allows to turn it on at the specified time without operator intervention.

To disable sites, the user shall have the "Edit disabling" permission for the "Site manager" module.

### Arming/Disarming by Duty Operator

If the equipment installed on the site does not imply the possibility of arming or disarming, it may be useful to emulate the events of arming or disarming by the duty operator. To enable this function, set the "Allow conditional arming and disarming by duty operator" parameter in the site settings.

After this parameter is set, an item will appear in the context menu of this site in the "Duty operator" module, allowing to create an event that will change the current state of the site.

For example, if the site is currently armed, the context menu item will be called "Disarm" and when it is selected, a system event will be created that has the default type of the "Disarm" class.

## Control Time

The "Control time" tab is intended for control of one of the most important parameters of site operation control.

\imgcapt{img/ObjMngr-09-ControlTime.png}{"Control time" tab}

The site control time is the time interval during which any event shall be received from the site. It shall be understood that the term "Control time" differs in meaning from the term "Autotest control". During autotest control it is expected that the site will send quite specific events. But if we are talking about the site control time in the Security Center software, then during its handling, any events received from the site are taken into account.

If it is necessary to control passing of test or any other specific events, it is possible to use "Event monitoring" or "Event chain monitoring" event handlers. More details about the purpose and how to use these event handlers can be found in the section on the "Event manager" module.

It is possible to configure the site control time to separately monitor all communication channels used by the site.

If the "Use common control time for all channels" item is selected, the Security Center software will take into account any events from the site received via any communication channels when handling the site control time.

This approach to setting the site control time is useful if the site uses only one communication channel for transmitting messages or the transmission of signals via backup communication channels is not somehow periodic.

The "Control time" parameter allows to set the hours and minutes during which an event shall be received from the site. If during the specified time no events from the site are received, then a system event with the "ZZXA" code will be created for this site. If any event is received from the site within the specified time, the interval of waiting for events will be restarted.

If 0 is specified as the value for the "Control time" parameter, the handling of the control time for this site will be disabled.

The "Ignore system events" parameter allows to ignore the events created in the Security Center software when handling the control time. It is not recommended to disable this parameter for no particular reason when monitoring received events from real sites.

Select the "Use individual control time for each channel" item if the site is equipped with communicators working via several communication channels and it is necessary to monitor the operation of each communication channel independently of the other. If this item is selected, it is possible to set the control time for each type of communication channel separately. When handling an individual control time, only events received via the controlled communication channel are taken into account. If there are no events within the specified interval for the site, a system event with the "ZZXAx" code will be created, where x will be a figure from 1 to 7 corresponding to the type of the monitored communication channel:

* "ZZXA1" - System

* "ZZXA2" - Radio

* "ZZXA3" - Telephone

* "ZZXA4" - Ethernet

* "ZZXA5" - GPRS

* "ZZXA6" - SMS

* "ZZXA7" - CSD

For events that are created for the site as a result of the operation of the Security Center algorithms, "System" is always specified as the receive channel, that is why the "Ignore system events" parameter is not present when setting the individual control time for each communication channel: the control time for the "System" channel can also be specified.

By default, events with "ZZXA" - "ZZXA7" codes are described in all event templates as alarms, that is, they require registration of operator actions for handling and cancellation. If necessary, it is possible to change the event description. See information about how to do this in the chapter of this description devoted to the "System setup" module.

## Arm Schedule

On the "Arm schedule" tab it is possible to specify the time periods for each day of the week when the site or its parts shall be armed, and also enable monitoring of this rule by the Security Center.

To make changes to the arm schedule settings, the user shall have the "Edit schedule" permission for the "Site manager" module.

\imgcapt{img/ObjMngr-10-ArmSchedule.png}{"Arm schedule" tab}

It is possible to make arm schedule for the whole site, and for each of its parts. By default, the tab is set to the "Schedule for the whole site" mode. This mode shall be used when making arm schedule for the whole site, that is, for all its parts. If it is necessary to create arm schedule for one or more parts of the site, use the drop-down menu. Here there are all parts created for the site, each of which can be selected to make a separate schedule.

The site or its sections arm schedule is indicated in the table, which lines correspond to the days of the week from Monday to Sunday, and columns to the thirty-minute intervals of the day.

The cells of the table are blue, when they indicate the time when the site or its parts shall be armed. If the cell is white, the site or its parts at the specified time shall be disarmed.

To add an interval during which a site or its parts shall be armed, it is necessary to draw a quadrangle corresponding to the desired interval by the mouse. To delete an interval from the protection time of a site or its parts, do the same operation.

If the drawn interval captures both the blue and white area, a window with two buttons will appear - "Add interval" and "Delete interval". If the site or its parts are to be armed during the selected time interval, click on the "Add interval" button. If the site or its parts shall be disarmed, click on the "Delete" button.

\imgcapt{img/ObjMngr-10-ArmSchedule-01.png}{"Arm schedule" tab}

It is possible to set the schedule control parameters using check-boxes located at the bottom of the tab. By checking the necessary boxes, specify the monitored states of the armed site.

\imgcapt{img/ObjMngr-10-ArmSchedule-02.png}{"Arm schedule" tab: site schedule control}

Arming control is configured using the following parameters presented in the "Arm" line:

* "Earlier". This parameter allows to get information about the fact that the site was armed earlier than indicated in the arm schedule. If the site was armed earlier, a system event with the "ZZWA" code is generated. Thus, the head of the protected enterprise can be notified via SMS that the employees left the workplace before the due time.

* "Later". This parameter allows to get information about the fact that the site was armed later than indicated in the arm schedule. If the site was armed later, a system event with the "ZZWB" code is generated. Thus, the head of a protected enterprise can be notified via SMS about the time delay of employees in the workplace.

* "No". This parameter allows to get information about the fact that the site is disarmed while according to the arm schedule it shall be armed. In this case, a system event "ZZXB" is created, which will be repeated with an interval specified by the parameter "Arm schedule alarm periodicity", before the site is armed or until the time when the site can be disarmed. The parameter "Arm schedule alarm periodicity" is set in the settings of the "Event manager" module.

Disarming control is configured using the following parameters presented in the line "Disarm":

* "Earlier". This parameter allows to get information about the fact that the site was disarmed earlier than indicated in the arm schedule. If the site was disarmed later, a system event with the "ZZXD" code is generated.

* "Later". This parameter allows to get information about the fact that the site was disarmed later than indicated in the arm schedule. If the site was disarmed later, a system event with the "ZZWD" code is generated. Thus, the head of the protected enterprise can be notified via SMS about the time of the site disarming, that is, the time of arrival of employees to the workplace.

* "No". This parameter allows to get information about the fact that the site is armed while according to the arm schedule it shall be disarmed. In this case, a system event with the "ZZWC" code is created. Thus, the head of a protected enterprise can be notified via SMS that employees do not arrive on time to the workplace.

In the field indicated by the timer icon, the time range is set, during which any violations in the schedule of sites are allowed (the maximum value of the parameter is 30 minutes). For example, minus 15 minutes from the arming time and plus 15 minutes from the disarming time in the schedule of sites.

Let's suppose, that the schedule for the site arming is from 21:45 to 09:15. With an acceptable deviation of 15 minutes, arming is allowed from 21:30 to 21:45, and disarming is allowed from 09:15 to 09:30.

By default, events with "ZZXB" and "ZZXD" codes are described in all event templates as alarms, that is, they require registration of operator actions for handling and cancellation. If necessary, it is possible to change the event description. See information about how to do this in the chapter of this description devoted to the "System setup" module.

If in the previous version of the Security Center the armed site schedule control was set for the site, then when the software is updated, the "No scheduled arming" and "Early disarming" parameters will be enabled for it. The remaining parameters for controlling the site schedule will be disabled.

It is possible to create arm schedule template based on the arm schedule. To do this, create arm schedule for the site or its part and click the "New template" button. It shall be noted that the "New template" button is available for clicking only if at least one time interval is added to the schedule.

In the "New arm schedule template" window that opens, the arm schedule used to create the template is given. Specify the name of the template and click the "Create template" button in this window.

\imgcapt{img/ObjMngr-10-ArmSchedule-03.png}{"Arm schedule" tab: new template}

To apply a template to the site or its part arm schedule, do the following:

select the required template in the drop-down menu in the "Template" field.

The arm schedule can be edited. To do this, select the "Edit" item in drop-down menu of the "Template" field. All created templates are displayed in the "Arm schedule template edit" window. Click on the line of the required template to enter a new name. Besides, the template can be deleted by clicking on the "Delete" link in the template line and confirming the template deletion.

\imgcapt{img/ObjMngr-10-ArmSchedule-04.png}{"Arm schedule" tab: template editing}

## Event Template

The "Event template" tab is intended for changing the event code template, used for decoding of events received from the site, disabling of alarm events, and for changing the properties of a specific event code for this site.

\imgcapt{img/ObjMngr-11-EventTemplate.png}{"Event template" tab}

The event template that will be used to decode events from the site can be selected from the list in the upper-left corner of the tab.

To change the event template used by the site, the user shall have the "Change event template" permission for the "Site manager" module.

Use the "Add event" button to add a new event to the site event template. Use the "Change event" button to change the description for the selected event. It shall be understood that the changes made will affect only this site and will not be reflected neither in the event code template used by the site nor in any other site.

Click on the "Delete" button to delete an event that was added to the template of this site, or an event, the description of which was changed for this site. Events belonging to the event code template used by the site cannot be deleted.

To change the description of events, the user shall have the "Edit event template" permission for the "Site manager" module. It is not necessary to enter the edit mode to make changes to the description of the event template.

If you change the template events, changes to the database are saved immediately after the user has made changes to the template event. It is not possible to undo changes.

When creating a new event or changing an existing event, it is possible to specify all event attributes in the "Edit event" window.

\imgcapt{img/ObjMngr-11-EventTemplate-01.png}{"Edit event" window}

A detailed description of the event fields is given in the chapter on the "System setup" module in the section describing the "Event template" tab.

Due to the fact that changes in the event template for a particular site are extremely difficult to control, it is recommended not to use them without special need.

Disabling an alarm event that can be performed using the "Disable event" button, by its value, is very similar to disabling a site, with the only difference being that it is only one event code. When receiving a disabled event in the "Duty operator" module, there is no sound for the event, and "Event manager" creates an automatic cancellation for this alarm. It shall be emphasized that, unlike canceling an alarm for a disabled site, canceling an alarm for a disabled event will cancel only this event - the site arming continues in its entirety, except for the disabled event code.

\imgcapt{img/ObjMngr-11-EventTemplate-02.png}{"Disable event" window}

The event can be disabled only for a limited time interval, which is indicated when the disabling is performed. After this interval, the event will be automatically enabled. It is possible to enable the disabled event manually at any time by clicking on the "Enable event" button.

All operations for disabling and enabling the event are accompanied by the creation of system events. For example, when an event is disabled, a system event with the "ZZXM" code is generated, when the event is automatically disabled, a system event with the "ZZXN" code is created, and when the event is enabled by the operator (manual enabling), a system event with the "ZZXO" code is generated.

Generating system events allows to accurately track the operations for disabling events.

It shall be noted that the quality of the event templates supplied with the new versions of the Security Center is constantly improving, that is why when describing sites it is recommended to use the latest versions of the event templates.

To replace the outdated event template with its latest version, use the function of replacing the event template implemented in the "System setup" module.

## Additional Characteristics

On the "Additional characteristics" tab it is possible to specify values for additional characteristics of sites (custom fields). Add a new additional characteristic or change an existing one in the "System setup" module, on the "Site fields" tab.

\imgcapt{img/ObjMngr-12-ExtFields.png}{"Additional characteristics" tab}

To save the changes made to the additional characteristics, it is necessary to confirm them by pressing the "Enter" button after completing the entry of the values.

If the value of any additional characteristic for the site is not defined, its value can be left blank. When displaying additional characteristics in the site card, only those which value is indicated are listed in the list of characteristics.

In order for the user to change the values of additional characteristics of the site, he/she shall have the "Edit additional characteristics" permission for the "Site manager" module.

## Event Handlers

The "Event Handlers" tab is intended to display and change the event handlers associated with the site. Read more about the variety and purpose of the event handlers supplied with the Security Center software in the chapter devoted to the "Event manager" module in the "Event handlers" section.

In order for the user to see the groups of handlers and event handlers on this tab, he/she shall have the "View event handlers" permission for the "Event manager" module.

\imgcapt{img/ObjMngr-13-EventHandlers.png}{"Event handlers" tab}

The purpose of the control panel buttons for the event handlers is the same as in the event handler in the "Event manager" module.

When configuring event handlers in the "Site manager" module, remember that not all groups of event handlers are displayed in the list, but only those handlers in groups which settings include the number of the current site.

In order for the user to make changes to the event handlers associated with the site, he/she shall have the "Edit event handlers" permission for the "Event manager" module.

## Equipment {#object-manager-equipment}

The "Equipment" tab of the "Site manager" module is intended to indicate the type of equipment used on the site and make the necessary settings. Entering information about the equipment provides the correct support of the Security Center installed on the site devices.

\imgcapt{img/ObjMngr-14-Equipment.png}{"Equipment" tab}

To configure the equipment, select the desired site and switch to the edit mode. From the list of systems presented on the "Equipment" tab, select the type of equipment used on the site: "TR-100 GSM III/Soyuz GSM", "AlarmView", "Lonta-202", "RS200", "Puper type 5", or "Neman". If the equipment of another system is installed on the site, specify the "Other" type.

For the types of equipment "TR-100 GSM III/Soyuz GSM", "Lonta-202", and "Other", specify the parameters for setting up the equipment. Remember that when copying a site for a new site, only the information about the installed equipment type is copied, but not the values of the specified parameters.

### "Other"

If the list of equipment types does not include the system used on the site, select the "Other" type. In the "Transmitter" section, set values for the "Site number" and "Part number" parameters.

If the site is one of the parts on the control panel, then in the "Site number" field set the site number of the control panel, and in the "Part number" field - the part number corresponding to the site.

### "C-Nord GSM (CML)"

This type of equipment shall be specified for the site if one of the following devices is installed on it:

* "Nord GSM" or "Nord GSM (WRL)"

* "Serzhant GSM"

* "Soyuz GSM (OEM) or "Soyuz GSM (BOX) "

* Transmitter "TR-100 GSM III", connected to the control panel produced by C.Nord or PIMA Electronic Systems Ltd.

The "ID" field will be automatically filled in after the device connects to the Security Center for the first time.

The device ID is the unique identification number of the processor installed in the device. When receiving events from the site, it is checked that the events are sent from the device which ID is the one assigned to the site. Protection against the equipment substitution is realized in that way.

When replacing the equipment connected to the control panel on the site, delete the value of the "ID" parameter. Do this with the "Delete" button located opposite the "ID" field. After deleting the old value, the ID of the new transmitter will be automatically determined in the "ID" field.

Deletion the value of this parameter is also necessary when the equipment is dismantled at the site or changed.

It is possible to remove the ID and change the type of equipment for one site, as well as for all sites assigned to this identifier. To do this, use the dialog box that appears when changing the type of equipment. When changing all sites assigned to the ID, specify any of the types of equipment listed in the list for the current site, and for other sites the "Other" type is specified by default.

### "Lonta-202"

Select the "Lonta-202" type of equipment when using the centralized radio security system "Lonta-202" (formerly called "Rif String RS202") manufactured by Altonika.

In the "Transmitter" section, set values for the "Site number" and "Part number" parameters. If the site is connected to the radio transmitter as one of the parts, then in the "Site number" field it is necessary to specify the site number of the transmitter, and in the "Part number" field - the parts number corresponding to the site.

The values indicated in the "Site number" and "Part number" fields are priority with respect to the standard numbers of the Security Center sites: when receiving events, the values ​​entered on the "Equipment" tab and first of all values of the site numbers are viewed first.

To control the quality of communication with the site on which the equipment of Lonta-202 system is used, it is necessary to set the threshold levels of the transmitter signal. Do this in the "Signal levels" section, indicating the corresponding parameter values in the "Level of warning" and "Level of alarm" fields.

If the level of the signal received from the site becomes less than the value specified in the "Level of warning" field, a system event with the "ZZXV" code will be created. If the level of the signal received from the site is less than the value specified in the "Level of alarm" field, a system event with the "ZZXU" code will be created. With the help of system events with "ZZXV" and "ZZXU" codes it is possible to automatically monitor the received signal level, attracting the operator&#39;s attention only to those sites where it is required to intervene.

It shall be noted that for sites on which the equipment of Lonta-202 system is installed, the function of viewing the received signal level is available in the "Duty operator" module. The site card has a tab that allows to display the signal level in the form of a graph or as a table of values.

### "RS200"

The "RS200 " type of equipment shall be selected when using the radio centralized protection system "Rif String RS200" manufactured by Altonika.

## Comment

The "Comments" tab is intended for entering an arbitrary description of the site.

\imgcapt{img/ObjMngr-15-Comments.png}{"Comments" tab}

In the "Comment for operator" field, the information intended for the Security Center operator is indicated. This information is displayed in the site card in the "Duty operator" module, so it is often used to store notes on the site: requests from the responsible persons, observations of engineers serving the site, recommendations to operators, etc.

In the "Commentary for guard" field, information for the guards is indicated. In case of the site alarm, it is transferred to the "Alarm to Guard" application.

## Videorouters {#object-manager-videorouter}

The "Videorouters" tab in the "Site manager" module allows to specify video routers for the site. Video cameras, installed on the site, shall be connected to these video routers.

Thanks to the installation of video cameras, remote monitoring of the site is possible. The surveillance can be conducted both by a responsible person of the protected enterprise by means of the web interface of the "Personal account" or mobile application, and the security company duty operator in the "Duty operator" module while handling an alarm.

\imgcapt{img/ObjMngr-19-VideoRouters.png}{"Videorouters" tab}

To add or change data about video routers, as well as view the keys of video routers installed on the site, the user shall have the "Change information about videorouters" permission for the "Site manager" module.

To add the video router installed on the site, click on the "Add videorouter" button on the "Videorouters" tab. In the "Router" field enter the ID of the video router, and in the "Key" field - the password for its authorization. The required data shall be indicated on the device. After that press the "Save" button to save information about the video router or the "Cancel" button to cancel saving. The current status icon of the video router displays the status of its connection.

The site card displays information about the configuration of the added video router. Namely: description of each of the video cameras connected to it and number of zones into their field of vision. This information is stored in the Security Center database and in the "Cloud".

To update the information about video cameras connected to the video router, click on the "Update camera list" button.

To delete information about the video router and the video cameras connected to it, click on the "Delete videorouter" button.

## Service {#object-manager-service}

The "Service" tab is intended to provide engineers with permissions for access to sites. The permission received by the engineer gives him/her the ability to remotely program the control panel on the site during the specified time interval.

When site in the list of sites on the tab is selected, information about engineers, date and time of permission start and end is displayed.

\imgcapt{img/ObjMngr-20-Support.png}{"Service" tab}

Only the user with the corresponding permission can grant site access to engineers.

To issue a permission, select the desired site in the site list and click the "Add permission" button.

\imgcapt{img/ObjMngr-21-Support-01.png}{"Issue permission for site access" window}

In the "Issue permission for site access" window fill in the following fields:

* "Engineer "- engineer from the drop-down list. The list displays the engineers created in the "Personnel manager" module. Engineers who have not confirmed the e-mail address for registration in the Cloud can also be selected from the list, but they will only gain access to sites after the registration is completed;

* "Allow access to the site from" and "to" - date and time of permission start and end, respectively. Permission to access the site can be issued for no more than thirty days. When issuing a permission for more than three days, the application will ask for confirmation. Besides, granting an engineer permission to access the site will cancel the permission granted to him/her for access to this site earlier.

After entering the data, click on the "Give permission" button to complete the operation. To cancel it, click on the "Cancel" button.

To remove the permission to access the site, select the permission in the list and click on the "Delete permission" button.

<!--
[id-05-16]: img/ObjMngr-16-Account.png ""Personal account" tab"

[id-05-17]: img/ObjMngr-17-Account-01.png "Event class editing"

[id-05-18]: img/ObjMngr-18-Account-02.png "Editing operator&#39;s actions and alarm cancellations"
-->