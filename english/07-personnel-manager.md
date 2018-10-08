# Personnel Manager

In the "Personnel manager" module, it is possible to edit the list of operators and their rights - in the Security Center modules, guards, that are used in the Security Center, as well as the list of computers on the local network, on which the Security Center network workplaces are allowed.

## Operators

\imgcapt{img/empman-01.png}{Operators tab}

The "Operators" tab is intended for editing the list of software operators and their rights in the Security Center modules.

To save the changes made on this tab, the user shall have the "Edit Groups" permission for the "Personnel manager" module.

Operator rights are individual for each Security Center module. Availability of this or that right determines the list of operations that can be performed in the module.

Before determining the operator's rights in the module, allow the operator to enter this module.

When creating a new operator, it is possible to assign him/her the same rights as one of the existing ones. To do this, before creating a new operator, in the list of operators select the user, whose rights shall be copied.

\imgcapt{img/empman-01-00.png}{Selecting list of rights for new operator}

It is forbidden to edit the name and rights of the operator, who entered the module, as well as "Administrator" in the module "Personnel Manager". 

For the current operator of the "Personnel manager" module and the "Administrator", only password changing is allowed.

### Operator’s Rights in "Event Manager" Module

\imgcapt{img/empman-01-01.png}{Operator’s rights in the "Event manager" module}

* "Exit from the program" - permission to shut down the "Event manager" module. 

* "Change settings" - permission to make changes to the settings of the "Event manager" module. 

* "View event handlers" - permission to view (but not to change) the settings of event handlers. This permission also applies to the "Event handlers" module. 

* "View hidden event handlers" - permission to view (but not to change) the settings of _hidden_ event handlers. This permission also applies to the "Event handlers" module. 

* "Edit event handlers" - permission to make changes to the settings of those event handlers that are allowed to view. This permission also applies to the "Event handlers" module.

### Operator’s Rights in "Duty Operator" Module

\imgcapt{img/empman-01-02.png}{Operator’s rights in the "Duty operator" module}

* "Enter into the program" - permission to enter the "Duty operator" module. If the operator has to handle the alarms, then he/she shall have this permission.

* "Exit from the program" - permission to close the "Duty operator" module. Ban on closing of the "Duty operator" module can be useful for inexperienced operators, as a warning about exiting the module by mistake.  

* "Change settings" - permission to make changes to the settings of the "Duty operator" module. It is not recommended to grant this permission to the duty operators, especially since the settings of the "Duty operator" module are associated with the computer on which the module is being executed, and not with the operator who launched the program. Thus, the administrator can perform all the necessary settings of the module on the computer and any operator, who launched the "Duty operator" module, will work with these settings.

* "Handle alarms" - permission to handle an alarm. The Security Center operator with this right can call the "Alarm handling" window and perform all possible actions to handle the alarm. To cancel the alarm, the operator shall also have the right to "Cancel alarm".

* "Cancel alarm" - permission to cancel alarm. The Security Center operator with this right can call the "Alarm handling" window and cancel the alarm. To handle an alarm, the operator shall also have the right to "Handle alarms".

* "Disable event codes" - permission to disable events. The Security Center operator with this right can call the "Disable event" window and disable the event, specifying the time during which the event shall be disabled and the reason for disabling.

* "Disable sites" - permission to disable sites. The Security Center operator with this right can call the "Site disabling" window and disable the site, specifying the time during which the site shall be disabled and the reason for disabling.

* "Disable channels for site" - permission to disable communication channels for the site. The Security Center operator with this right can call the window "Site channels disabling" and disable one or several communication channels, specifying the time during which the communication channels shall be disabled, and the reason for disabling.

* "Remote arm site/remote disarm site" - permission for remote arming/disarming of sites. The Security Center operator with this right can arm/disarm the site, if the equipment with the type of the transmitter "TR-100 GSM III" is installed on the site. 

### Operator’s Rights in "Site Manager" Module

\imgcapt{img/empman-01-03.png}{Operator’s rights in the "Site manager" module}

* "Enter into the program" - permission to enter the "Site manager" module. If the operator shall be able to view and edit site cards, then he/she shall have this permission.

* "Edit sites" - permission to edit site cards. This permission applies to most fields of the site card, with the exception of those fields for which changes additional permissions described below are required. With the help of additional permissions it is possible to protect important or rarely changed card fields from accidental changes.

* "Change template" - permission to change the site event template. The event template determines how messages received from the site equipment will be decoded: which messages shall be considered alarm ones, which messages shall be considered as armings, etc. Which particular event template shall be used for a site depends on the equipment installed on the site, as well as on the communication channels via which messages from the site are transmitted. For most modern site devices, the event template "Radio (EPAF), DTMF, GPRS", which is included in the Security Center package, is suitable and recommended for use.

* "Edit template" - permission to edit descriptions of events included in the event template set for the site. It shall be noted that the changes will be applied only to the site for which changes are made and the event template itself won’t be affected in any way. It is strongly recommended not to make changes to the site event template without a valid reason.

* "Edit schedule" - permission to edit the parameters of the site arm schedule. If the arm schedule is set for the site and its monitoring is enabled, then, if the schedule is violated, the Security Center will create the appropriate system events (alarms).

* "Edit long-term arm" - permission to edit the parameters of long-term arm of the site. If the long-term arm is enabled for the site, then when you try to disarm the site, the Security Center will create a system event (alarm).

* "Change site images" - permission to change the site images. 
  
<!-- Image data are used in the "Alarm to Guard" application to provide more complete information about the site. -->

* "Restore deleted sites" - permission to restore deleted sites.

* "Locate site on map" - permission to change the location of the site on the map.

* "Edit additional characteristics" - permission to change the values of additional characteristics of the site. Important information can be indicated in the additional characteristics of the site.

* "Edit disabling" - permission to change the disabling parameters of the site. For disabled sites, Security Center performs automatic cancellation of alarms, without notification of the duty operator about them.

* "Grant site access to engineer" - permission to grant remote access to sites to engineers.

* "Change information about videorouters" - permission to change information about video routers. This permission allows to add and remove video routers, to which the cameras on the site are connected.

* "Edit arm schedule templates" - permission to edit arm schedule templates. With this permission, it is possible to create, edit and delete templates based on the selected arm schedule.

### Operator’s Rights in "Report Manager" Module

\imgcapt{img/empman-01-04.png}{Operator’s rights in the "Report manager" module}

* "Enter into the program" - permission to enter the "Report manager" module. If the operator shall be able to create reports, then he/she shall have this permission.

* "Generate reports by events" - permission to create reports on the received events. When creating these reports, the operator has access to the list of sites, as well as to the list of event classes. The generated reports contain information about the events that were received during a given period, events from undescribed sites, and sent SMS messages.

* "Generate reports by alarms" - permission to create report on alarms. When creating these reports, the operator has access to the list of sites, as well as to the list of event classes and operator’s actions. The generated reports contain information about the received events, operator’s actions for handling alarms and guard responses. Besides, some of the alarm reports provide information on the basis of which it is possible to identify problematic sites and analyze the causes of the alarms.

* "Generate reports by arm time" - permission to create alarm reports. When creating these reports, the operator has access to the list of sites, as well as to the list of event classes. The created reports contain information about the time during which the sites were to be protected in accordance with their arm schedule, as well as the time during which the sites were actually armed.

* "Create reports by guards" - permission to create reports on guards. When creating these reports, the operator has access to a list of sites, as well as to lists of event classes and guards. The generated reports contain information about the received events, operator’s actions for handling alarms and guard responses. 

* "Generate reports by sites" - permission to create reports by sites. When creating these reports, the operator has access to the list of sites. The created reports can contain all the information available in the site cards.

* "Edit report templates" - permission to create new and edit existing forms, on the basis of which reports in the "Report manager" module can be created. It is strongly recommended not to grant this permission to operators, and also to make changes to report templates without backing up the modified data.

### Operator’s Rights in "Site Maps" Module

\imgcapt{img/empman-01-05.png}{Operator’s rights in the "Site maps" module}

* "Enter into the program" - permission to enter the "Site maps" module. If the operator shall be able to view or edit site maps, including - to view the maps of sites when handling an alarm, then he/she shall have this permission.

* "Edit site maps" - permission to create new and edit the existing site maps.

### Operator’s Rights in "System Setup" Module

\imgcapt{img/empman-01-06.png}{Operator’s rights in the "System setup" module}

* "Enter into the program" - permission to enter the "System setup" module. If the operator shall be able to view or change the settings of the system directories of the Security Center, then he/she shall have this permission.

* "Edit event templates" - permission to create new and edit the existing event templates. The event template determines how messages received from the site equipment will be decoded: which messages shall be considered alarm ones, which messages shall be considered as armings, etc. Changes that are made to the description of the template events in the "System setup" module will affect all sites that use the edited event template. It is strongly recommended not to make changes to the site event template without a valid reason.

* "Edit site types" - permission to create new and edit the existing site types. Types are the mechanism for grouping and filtering sites in the list. If you change, for example, rename a site type in the "System setup" module, this change will affect all sites for which the changed type is set.

* "Edit event classes" - permission to create new and edit the existing event classes. The event class is a key entity for all processes of the Security Center software related to the handling of the received events. Introduction of changes to event classes shall be done carefully and with great attention.

* "Edit actions" - permission to create new and edit the existing operator’s actions, performed during alarm handling. To create and edit alarm handling scripts, the user shall have this permission.

* "Edit alarm cancellation" - permission to create new and edit the existing causes for canceling alarms. To create and edit alarm handling scripts, the user shall have this permission.

* "Edit site fields" - permission to edit the site fields (additional characteristics). Additional characteristics of the sites are useful in the event, when it is necessary to add information to the site card for which there is no special field, and it is not advisable to enter it into notes. This permission may be necessary for those users of the Security Center, whose task is to maintain the database of the site cards.

### Operator’s Rights in "Nord-LAN Key Configurator" Module

\imgcapt{img/empman-01-07.png}{Operator’s rights in the "Nord-LAN key Configurator" module}

* "Enter into the program" - permission to launch the "Nord-LAN keys Configurator" module. 

* "Edit key mapping" - permission to change the list of keys that allow you arm or disarm a specific site.

* "Edit list of keys" - permission to edit the general list of keys Touch-memory, intended for arming and disarming sites equipped with site devices "Nord-LAN".

### Operator’s Rights in "Personnel Manager" Module

\imgcapt{img/empman-01-08.png}{Operator’s rights in the "Personnel manager" module}

* "Enter into the program" - permission to launch the "Personnel manager" module.

* "Edit operators" - permission to indicate details for new operators, as well as to change the password and rights of the existing operators. A user with this permission cannot change his/her own rights in the Security Center modules, as well as the rights of the "Administrator".
 
* "Edit guards" - permission to change the list of guards. Guards are used for alarm handling - when registering activities related to a guard, the operator selects the guard, in relation to which the action is registered, from the list.
 
* "Edit computers" - permission to edit the list of computers on which the Security Center modules can be launched.

* "Edit engineers" - permission to edit the list of engineers for granting them remote access to sites.
 
## guards

\imgcapt{img/empman-02.png}{"Guards" tab}

On the "Guards" tab it is possible to edit the list of guards that are used in the Security Center software.

To save the changes made on this tab, the user shall have the "Edit Groups" permission for the "Personnel manager" module.

## Computers

\imgcapt{img/empman-03.png}{"Computers" tab}

The "Computers" tab is intended to manage the list of computers on which the network workplaces of the Security Center software are allowed, and to manage the list of sites available on these computers.

To save the changes made on this tab, the user shall have the "Edit computers" permission for the "Personnel manager" module.

### Allow to run Security Center modules on computers from list only

If this option is disabled, the Security Center modules can be run on any computer on the network. In this case, if the computer on which the Security Center modules are launched is not included in the list, it will be added there automatically. 

If the restriction that allows the network workstations of the Security Center to be used only on those computers, that are included in the list, is included, then the attempt to launch any module of the Security Center on a computer that is not on the list will be rejected. Computers shall be added to the list manually.

### Sites specified for computer

If necessary, for each computer it is possible to define a list of site numbers that are allowed to be downloaded by the Security Center modules, that are launched on this computer.

This function is useful, when the duty operators use the scheme of dividing sites between network workplaces. For example, on one computer, the operator works with sites from the first number to the third hundredth, on the next - from the three hundred first number to the six hundredth and so on.

## Engineers {# personnel-manager-engineer}

\imgcapt{img/empman-04.png}{"Engineers" tab}

The "Engineers" tab is used to manage the list of engineers that can be granted permissions to access remote site management.

\imgcapt{img/empman-04-00.png}{Add engineer}

The list of engineers can be edited by the user who has the right to "Edit engineers".

To add an engineer to the list, click the "New..." button. This opens the "Add engineer" window, in which the following fields shall be filled:

* "Surname" is the engineer surname. The surname and the name of the engineer shall be entered in Russian or Latin letters;

* "Name" - the engineer name;

* "Phone" - mobile phone number in international format;

* "Email" - the email address of the engineer.

After entering the data, click the "Add" button to add the engineer. At the same time, the surname, name and email of the created engineer will be displayed in the list of engineers. To cancel the changes, click the "Cancel" button. 

After creating the engineer account, a letter will be sent to his/her email address. The engineer shall confirm the e-mail address to complete the registration in the Cloud by following the link in the letter, and then create and confirm the password for accessing the web interface for remote site programming.

To change information about the engineer, select him/her in the list and click "Change". This opens the "Edit engineer" window. Changing the engineer email after creating an account in the system is impossible.

To remove the engineer, select him/her in the list and click "Delete", after that confirm the deletion in the new window.

Save changes in the list of engineers by clicking the "Save" button. Otherwise, click on the "Cancel" button.

Information about the permissions granted to the engineer for access to sites is displayed in the list of "Permissions for engineer". When selecting an engineer, the list contains information about the site number, its name, and date and time of the beginning and ending of the permission to access it.

To cancel the permission granted to the engineer for access to a site, select the permission in the list and click the "Delete permission" button.

[id-07-15]: img/empman-05.png ""Administrators of personal account" tab"
[id-07-16]: img/empman-05-00.png "Add administrator of personal account"
